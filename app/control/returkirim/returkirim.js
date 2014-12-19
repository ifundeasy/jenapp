// classes
function ReturPengiriman(){this.initialize()}
function ReturPengirimanDetail(_id_pos_return, _id_pos_bill_ex, _id_product){this.initialize(_id_pos_return, _id_pos_bill_ex, _id_product)}
// classes --end
// constructors
ReturPengiriman.prototype.initialize = function(){
	var me = this;
	// define properties
	me.id_pos_return 	= '';
	me.datetime 		= '';
	me.id_internal 		= '';
	me.notes 			= '';
	me.item_list 		= new Array();
	// define properties --end
	// call mandatory methods
	me.configureTransNoField();
	me.getIdInternal();
	me.configureDatefield();
	me.configureSearchTransId();
	me.configureOfficerField();
	me.configureNoteField();
	me.configureItemTableField();
	// call mandatory methods --end
}
ReturPengirimanDetail.prototype.initialize = function(_id_pos_return, _id_pos_bill_ex, _id_product){
	var me = this;
	// define properties
	me.id_pos_return 	= _id_pos_return; // diisi dari isi form id transaksi
	me.id_pos_bill_ex 	= _id_pos_bill_ex;
	me.id_product 		= _id_product;
	me.qty 				= 0;
	me.notes 			= '';
	// define properties --end
	// call mandatory methods
	
	// call mandatory methods --end
}
// constructors --end
// get internal id
ReturPengiriman.prototype.getIdInternal = function(){
	var me = this;
	$.ajax({url		: './app/control/user_info.php',type:'GET',async:false,data:{},
		success	: function(datanya){ 
			var contact = JSON.parse(datanya)[0];
			$.ajax({url		: './server/api/internal',type:'GET',async:false,data:{
				f0_n: 'fk.id_contact',
				f0_l: '=',
				f0_v: contact
			},
				success	: function(data, status, xhr){ 
					me.id_internal =  JSON.parse(xhr.responseText).data[0].id_internal;
			}, error: function(){
				console.error("error saat pengambilan data internal.");	
			}});
	}, error: function(){
		console.error("error saat pengambilan data user.");	
	}});
}
// get internal id --end
// validate data before commit
ReturPengiriman.prototype.validate = function(){
	var me = this;
	// kirim data ke server untuk verifikasi
	$.ajax({
		url		: './server/api/pos_return',
		type	: 'GET',
		async	: false,
		data 	: {
			f0_n: 'id_pos_return', 
			f0_l: '=', 
			f0_v: me.id_pos_return
		},
		success	: function(data, status, xhr){
			console.log("verifikasi 'id_pos_return' :");
			console.log(JSON.parse(xhr.responseText));
			if(JSON.parse(xhr.responseText).data.length != 0){
				console.error("Error! id transaksi retur sudah ada.");
			} else {
				// creating the timestamp exactly when button submit is pressed
				var trans_time = new Date().format('HH') + ":" + new Date().format('mm') + ":" + new Date().format('ss');
				var trans_date = $('#inputDateTransReturKirim').datepicker('getDate').format('yyyy-mm-dd');
				var trans_timestamp = new Date(trans_date+" "+trans_time).format('yyyy-mm-dd HH:mm:ss');
				me.datetime = trans_timestamp;
				// save
				me.commit();
			}
		},
		error : function(xhr, status, err){
			console.error("Error! kesalahan server saat verifikasi.");
		}
	});
	// kirim data ke server untuk verifikasi --end
}
// validate data before commit --end
// insert data to DB
ReturPengiriman.prototype.commit = function(){
	var me = this;
	console.log("saving 'pos_return' :");
	$.ajax({
		url		: './server/api/pos_return',
		type	: 'POST',
		async	: false,
		data 	: {
			id_pos_return 	: me.id_pos_return,
			datetime 		: me.datetime,
			'fk.id_internal': me.id_internal,
			active 			: 1,
			notes 			: me.notes
		},
		success : function(data, status, xhr){
			console.log("data master insertion : ");
			console.log(JSON.parse(xhr.responseText));
			console.log("saving 'pos_return_ex' :");
			me.insertDetail(0);
		},
		error : function(){
			console.error("Error! kesalahan server saat penyimpanan data master.");
		}
	});
}
// insert data to DB --end
// insert detail data to DB
ReturPengiriman.prototype.insertDetail = function(counter){
	var me = this;
	if(counter == me.item_list.length){
		alert("Data Pengiriman Berhasil Disimpan.");
		$('#btnResetTransReturKirim').trigger('click');
		$('#btnResetTransReturKirim').toggleClass('disabled');
		$('#btnSubmitTransReturKirim').toggleClass('disabled');
	} else {
		$.ajax({
			url		: './server/api/pos_return_ex',
			type	: 'POST',
			async	: false,
			data 	: {
				'fk.id_pos_return' 	: me.item_list[counter].id_pos_return,
				'fk.id_pos_bill_ex' : me.item_list[counter].id_pos_bill_ex,
				qty					: me.item_list[counter].qty,
				active 				: 1,
				notes 				: me.item_list[counter].notes
			},
			success : function(data2, status2, xhr2){
				console.log("data detail insertion : ");
				console.log(JSON.parse(xhr2.responseText));
				var new_counter = counter+1;
				me.insertDetail(new_counter);
			},
			error : function(){
				console.error("Error! kesalahan server saat penyimpanan data detail.");
			}
		});
	}
}
// insert detail data to DB --end
// insert new row to the table
ReturPengiriman.prototype.addNewItems = function(_transId){
	var me = this;
	var table = $('#tableReturKirim');
	var tbody = table.find('tbody');
	AjaxSync('get', './server/custom/get_retur_kirim_detail', { id_pos: _transId }, function (jqXHR, textStatus, rawData) {
		rawData.forEach(function(content){
			// new detail object
			var barang_retur = new ReturPengirimanDetail(me.id_pos_return, content.id_pos_bill_ex, content.id_product);
			me.item_list.push(barang_retur);
			// add to table
			var tr = table.find('tbody>tr').length + 1;
			var str = "<tr id=" + content.id_pos_bill_ex + ">" +
				"<td align='center'>" + tr + "</td>" +
				"<td align='left'>" + content.id_pos + "</td>" +
				"<td align='left'>" + content.id_product + "</td>" +
				"<td align='left'>" + content.name + "</td>" +
				"<td align='right'>" + content.qty_available + "</td>" +
				"<td align='right'>" + content.qty_retur + "</td>" +
				"<td align='center'><input type='number' style='width: 60px;' min=0 max=" + content.qty_available + " value=" + 0 + "></td>" +
				"<td align='right'>" + content.harga + "</td>" +
				"<td align='center'><input type='button' class='btn btn-sm btn-danger' value='Hapus'></td>" +
				"</tr>";
			tbody.append(str);

			// add event for delete button
			tbody.find('input[type="button"]').off('click');
			tbody.find('input[type="button"]').on('click', function (event) {
				// remove selected element from array of detail objects
				var counter = 0;
				var tr_to_remove = $(event.target).closest('tr').attr('id');
				while(counter!=me.item_list.length){
					if(me.item_list[counter].id_pos_bill_ex == tr_to_remove){
						me.item_list.splice(counter, 1);
						counter = me.item_list.length;
					} else {
						counter++;
					}
				}
				// remove selected element from array of detail objects --end
				// remove from table
				$(event.target).closest('tr').remove();
				$.each(tbody.find("tr"), function (i, tr) {
					var row = $(tr).children().get(0);
					$(row).html(i + 1);
				});
				// recalculate everything
				me.calculate();
			});
			// add event for delete button --end
			//Add an event change input number on collumn
			tbody.find('input[type="number"]').off('input');
			tbody.find('input[type="number"]').on('input', function (event) {
				var qty_to_change = $(event.target).closest('tr').attr('id');
				for(s=0;s<me.item_list.length;s++){
					if(me.item_list[s].id_pos_bill_ex == qty_to_change){
						me.item_list[s].qty = parseInt($(event.target).val());
					}
				}
				me.calculate();
			});
			//Add an event change input number on collumn --end
		});
		$('#inputTransKirim').val('');
		me.calculate();
	});
}
// insert new row to the table --end
// calculate everything when things change
ReturPengiriman.prototype.calculate = function(){
	var me = this;
	var products = [];
	var qty = 0;
	me.item_list.forEach(function(item){
		products.push(item.id_product);
		qty += parseInt(item.qty);
	});
	$('#inputTotalQtyReturKirim').html(qty);
	$('#inputTotalItemsReturKirim').html(products.getUnique().length);
}
// calculate everything when things change --end	
// configure trans number field
ReturPengiriman.prototype.configureTransNoField = function(){
	var me = this;
	$('#inputNoTransReturKirim').off('input');
	$('#inputNoTransReturKirim').on('input', function(){
		me.id_pos_return = $('#inputNoTransReturKirim').val();
	});
	$('#inputNoTransReturKirim').val("rtr-"+Date.now().toString());
	me.id_pos_return = $('#inputNoTransReturKirim').val();
}
// configure trans number field --end
// configure datepicker object
ReturPengiriman.prototype.configureDatefield = function(){
	var me = this;
	$('#inputDateTransReturKirim').datepicker({
		weekStart         : 1,
		language          : "id",
		format            : "dd-mm-yyyy",
		daysOfWeekDisabled: "0",
		multidate		  : false,
	    autoclose		  : true,
		startDate         : new Date()
	});
	$('#inputDateTransReturKirim').datepicker('update', new Date());
};
// configure datepicker object --end
// configure seach trans id field
ReturPengiriman.prototype.configureSearchTransId = function(){
	var me = this;
	var transList = new Array();
	// get list of transactions
	AjaxSync('get', './server/api/pos', {}, function (jqXHR, textStatus, rawData) {
		for(i=0; i<rawData.length; i++){
			transList.push({
				data 	: rawData[i].id_pos,
				value	: rawData[i].id_pos,
			});
		}
	});
	// get list of transactions --end
	// configure autocomplete object
	$('#inputTransKirim').autocomplete({
	    lookup: transList,
	    onSelect: function (suggestion) {
	        console.log('selected: ' + suggestion.value + ', ' + suggestion.data);
	        me.addNewItems(suggestion.value);
	    }
	});
    // configure autocomplete object --end
}
// configure seach trans id field --end
// configure 'Pengaju' field
ReturPengiriman.prototype.configureOfficerField = function(){
	var me = this;
	$.ajax({url		: './app/control/user_info.php',type:'GET',async:false,data:{},
		success	: function(datanya){ 
			$('#inputInternalReturKirim').val(JSON.parse(datanya)[2] + " " + JSON.parse(datanya)[3]);
	}});
}
// configure 'Pengaju' field --end
// configure note field
ReturPengiriman.prototype.configureNoteField = function(){
	var me = this;
	$('#textareaNotesReturKirim').on('input', function(){
		me.notes = $(this).val();
	});
	$('#textareaNotesReturKirim').val('');
}
// configure note field --end
// configure item table
ReturPengiriman.prototype.configureItemTableField = function(){
	$('#tableReturKirim').find('tbody').html('');
}
// configure item table --end
$(document).ready(function(){
	var retur_kirim_baru = new ReturPengiriman();
	$('#btnResetTransReturKirim').click(function(){
		retur_kirim_baru = new ReturPengiriman();
	});
	$('#btnSubmitTransReturKirim').click(function(){
		$('#btnResetTransReturKirim').toggleClass('disabled');
		$('#btnSubmitTransReturKirim').toggleClass('disabled');
		retur_kirim_baru.validate();
	});
});

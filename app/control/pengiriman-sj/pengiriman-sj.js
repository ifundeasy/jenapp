// define class
function Pengiriman_sj(){this.initialize()}
function Pengiriman_sj_detail(_product, _qty, _discount, _price){this.initialize(_product, _qty, _discount, _price)}
// act as a contructor
Pengiriman_sj.prototype.initialize = function(){
	var me = this;
	// define properties
	me.id_pos 			= "tr-"+Date.now().toString();
	me.datetime 		= ''; // new Date().format("yyyy-mm-dd HH:mm:ss");
	me.id_internal	 	= '';
	me.pic				= '';
	me.active 			= 1;
	me.notes			= '';
	me.item_list		= new Array();
	// define properties --end
	// call mandatory methods
	me.getIdInternal();
	me.configureOutletFields();
	me.configureDatefield();
	me.configureTransNumberField();
	me.configureNewItemFields();
	me.configureTaxField();
	me.configureOfficerField();
	me.configureItemTableField();
	me.configureNoteField();
	me.clickBtnAddProduct();
	me.calculate();
	// call mandatory methods --end
}
Pengiriman_sj_detail.prototype.initialize = function(_product, _qty, _discount, _price){
	var me = this;
	// define properties
	me.id_pos_ex			= Date.now().toString();
	me.datetime 			= new Date().format("yyyy-mm-dd HH:mm:ss");
	me.id_pos	 			= $('#inputNoTransKirimsj').val();
	me.id_product			= _product;
	me.id_product_sale_price= _price;
	me.qty					= _qty;
	me.discount				= _discount;
	me._void				= 0;
	me.complimentary		= 0;
	me.active				= 1;
	me.notes				= '';
	// define properties --end
	// call mandatory methods

	// call mandatory methods --end
}
// act as a contructor --end
// get internal id
Pengiriman_sj.prototype.getIdInternal = function(){
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
// calculate everything when things change
Pengiriman_sj.prototype.calculate = function(){
	var me = this;
	var products = [];
	var tax = $('#inputTaxKirimsj').val();
	var total = 0;
	var qty = 0;
	me.item_list.forEach(function(item){
		products.push(item.id_product);
		qty += parseInt(item.qty);
		total += parseInt((item.qty * item.id_product_sale_price) - (item.qty * item.id_product_sale_price * item.discount / 100));
	});

	$('#inputTotalQtyKirimsj').html(qty);
	$('#inputTotalItemsKirimsj').html(products.getUnique().length);
	$('#inputTotalKirimsj').val(total);
	$('#inputGrandTotalKirimsj').val(total + (total * tax / 100));
};
// calculate everything when things change --end
// validate data before inserting
Pengiriman_sj.prototype.validate = function(){
	var me = this;
	// kirim data ke server untuk verifikasi
	$.ajax({
		url		: './server/api/pos',
		type	: 'GET',
		async	: false,
		data 	: {
			f0_n: 'id_pos', 
			f0_l: '=', 
			f0_v: me.id_pos
		},
		success	: function(data, status, xhr){
			console.log("verifikasi 'id_pos' :");
			console.log(JSON.parse(xhr.responseText));
			if(JSON.parse(xhr.responseText).data.length != 0){
				console.error("Error! id transaksi sudah ada.");
			} else {
				// creating the timestamp exactly when button submit is pressed
				var trans_time = new Date().format('HH') + ":" + new Date().format('mm') + ":" + new Date().format('ss');
				var trans_date = $('#inputTglTransKirimsj').datepicker('getDate').format('yyyy-mm-dd');
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
// validate data before inserting --end
// insert record to DB
Pengiriman_sj.prototype.commit = function(){
	var me = this;
	console.log("saving 'pos' :");
	$.ajax({
		url		: './server/api/pos',
		type	: 'POST',
		async	: false,
		data 	: {
			id_pos 			: me.id_pos,
			datetime 		: me.datetime, // new Date().format("yyyy-mm-dd HH:mm:ss");
			'fk.id_internal': me.id_internal,
			pic 			: me.pic,
			active 			: me.active,
			notes 			: me.notes
		},
		success	: function(data, status, xhr){
			console.log(JSON.parse(xhr.responseText));
			// transaction item(s)
			console.log("saving 'pos_ex' :");
			me.item_list.forEach(function(item){
				// get pricelist from db
				AjaxSync('get', './server/custom/get_price_id', {
					id_product 	: item.id_product,
					value		: item.id_product_sale_price
				}, function (jqXHR, textStatus, rawData) {
					if(rawData.length != 0){
						var price_id = rawData[0].id_product_sale_price;
						$.ajax({
							url		: './server/api/pos_ex',
							type	: 'POST',
							async	: false,
							data 	: {
								id_pos_ex 					: item.id_pos_ex,
								datetime 					: item.datetime,
								'fk.id_pos' 				: item.id_pos,
								'fk.id_product' 			: item.id_product,
								'fk.id_product_sale_price'	: price_id,
								qty 						: item.qty,
								discount 					: item.discount,
								'void' 						: item._void,
								complimentary 				: item.complimentary,
								active 						: item.active,
								notes 						: item.notes
							},
							success : function(data, status, xhr){
								console.log(JSON.parse(xhr.responseText));
							},
							error : function(xhr, status, err){
								console.error("Error! kesalahan server saat penyimpanan data detail.");
							}
						});
					} else {
						console.error("no price id reference.");
					}
				});
			});
			alert("Data Pengiriman Berhasil Disimpan.");
			$('#btnResetTransKirimsj').trigger('click');
		},
		error : function(xhr, status, err){
			console.error("Error! kesalahan server saat penyimpanan data master.");
		}
	});
}
// insert record to DB --end
// adding new item to table
Pengiriman_sj.prototype.clickBtnAddProduct = function(){
	var me = this;
	$('#btnAddProductKirimsj').off('click');
	$('#btnAddProductKirimsj').on('click', function(){
		var table 			= $('#tabelPengirimanBaru');
		var product_id 		= $('#inputIdProductKirimsj').val();
		var product_name 	= $('#inputProductKirimsj').val();
		var qty 			= $('#inputProductQtyKirimsj').val();
		var discount 		= $('#inputProductDiscountKirimsj').val()
		var price 			= $('#inputProductPriceKirimsj').val();
		if (product_id && qty && discount && price) {
			var barang_baru = new Pengiriman_sj_detail(product_id, qty, discount, price);
			me.item_list.push(barang_baru);
			var tbody = table.find('tbody');
			var tr = table.find('tbody>tr').length + 1;
			var total = (qty * price) - (qty * price * discount / 100);
			var str = "<tr id=" + barang_baru.id_pos_ex + ">" +
				"<td align='center'>" + tr + "</td>" +
				"<td align='left'>" + product_id + "</td>" +
				"<td align='left'>" + product_name + "</td>" +
				"<td align='center'>" + qty + "</td>" +
				"<td align='right'>" + price + "</td>" +
				"<td align='right'>" + discount + "</td>" +
				"<td align='right'>" + total + "</td>" +
				"<td align='center'><input type='button' class='btn btn-sm btn-danger' value='Hapus'></td>" +
				"</tr>";

			tbody.append(str);
		} else {
			console.error("data barang tidak valid!");
		}
		me.calculate();
	});
}
// adding new item to table --end
// configure 'Tujuan Penerimaan' field
Pengiriman_sj.prototype.configureOutletFields = function(){
	var me = this;
	var outletList = new Array();
	// get list of outlets (table 'member')
	$.ajax({
		url		: './server/api/view_outlet',
		type	: 'GET',
		async	: false,
		success	: function(data, status, xhr){
			var result = JSON.parse(xhr.responseText).data;
			for(i=0; i<result.length; i++){
				outletList.push({
					'value': result[i].nama_outlet,
					'data' : result[i].id
				});
			} 
		},
		error : function(xhr, status, err){
			console.error("Error! kesalahan server saat pengambilan data outlet.");
		}
	});
	// get list of outlets (table 'member') --end
	// configure autocomplete object
	$('#inputTujuanKirimsj').autocomplete({
	    lookup: outletList,
	    onSelect: function (suggestion) {
	    	me.pic = suggestion.data;
	        //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
	        $('#inputAlamatKirimsj').val(''); //alamatnya, blm direlasikan
	    }
    // configure autocomplete object --end
	});
	$('#inputTujuanKirimsj').val('');
	$('#inputAlamatKirimsj').val('');
}
// configure 'Tujuan Penerimaan' field --end
// configure datepicker object
Pengiriman_sj.prototype.configureDatefield = function(){
	var me = this;
	$('#inputTglTransKirimsj').datepicker({
		weekStart         : 1,
		language          : "id",
		format            : "dd-mm-yyyy",
		daysOfWeekDisabled: "0",
		multidate		  : false,
	    autoclose		  : true,
		startDate         : new Date()
	});
	$('#inputTglTransKirimsj').datepicker('update', new Date());
};
// configure datepicker object --end
// configure transaction id field
Pengiriman_sj.prototype.configureTransNumberField = function(){
	var me = this;
	$('#inputNoTransKirimsj').val(me.id_pos);
};
// configure transaction id field --end
// configure new item fields
Pengiriman_sj.prototype.configureNewItemFields = function(){
	var itemList = new Array();
	// get list of items
	AjaxSync('get', './server/custom/harga', {}, function (jqXHR, textStatus, rawData) {
		rawData.forEach(function(content){
			itemList.push({
				data 	: content.id_product,
				value	: content.name,
				price 	: content.product_sale_price
			});
		});
	});
	// get list of items --end
	// configure autocomplete object
	$('#inputProductKirimsj').autocomplete({
	    lookup: itemList,
	    onSelect: function (suggestion) {
	        console.log('selected: ' + suggestion.value + ', ' + suggestion.data);
	        $('#inputIdProductKirimsj').val(suggestion.data);
	        $('#inputProductQtyKirimsj').val(1);
	        $('#inputProductDiscountKirimsj').val(0);
	        $('#inputProductPriceKirimsj').val(suggestion.price);
	    }
	});
    // configure autocomplete object --end
    $('#inputProductKirimsj').val('');
    $('#inputIdProductKirimsj').val('');
    $('#inputProductQtyKirimsj').val('');
    $('#inputProductDiscountKirimsj').val('');
    $('#inputProductPriceKirimsj').val('');
}
// configure new item fields --end
// configure tax field
Pengiriman_sj.prototype.configureTaxField = function(){
	var me = this;
	$('#inputTaxKirimsj').on('input', function(){
		me.calculate();
	});
	$('#inputTaxKirimsj').val(0);
}
// configure tax field --end
// configure 'Pengaju' field
Pengiriman_sj.prototype.configureOfficerField = function(){
	$.ajax({url		: './app/control/user_info.php',type:'GET',async:false,data:{},
		success	: function(datanya){ 
			$('#inputInternalKirimsj').val(JSON.parse(datanya)[2] + " " + JSON.parse(datanya)[3]);
	}});
}
// configure 'Pengaju' field --end
// configure item table
Pengiriman_sj.prototype.configureItemTableField = function(){
	$('#tabelPengirimanBaru').find('tbody').html('');
}
// configure item table --end
// configure note field
Pengiriman_sj.prototype.configureNoteField = function(){
	var me = this;
	$('#textareaNotesKiirmsj').on('input', function(){
		me.notes = $(this).val();
	});
	$('#textareaNotesKiirmsj').val('');
}
// configure note field --end
$(document).ready(function(){
	var kirim_baru = new Pengiriman_sj();
	$('#btnResetTransKirimsj').click(function(){
		kirim_baru = new Pengiriman_sj();
	});
	$('#btnSubmitTransKirimsj').click(function(){
		kirim_baru.validate();
	});
});
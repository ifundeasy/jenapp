// define class
function Pengiriman_sj(){this.initialize()}
function Pengiriman_sj_detail(){this.initialize()}
// act as a contructor
Pengiriman_sj.prototype.initialize = function(){
	var me = this;
	// define properties
	me.id_purchase 		= "tr-"+Date.now().toString();
	me.timestamp 		= ''; // new Date().format("yyyy-mm-dd HH:mm:ss");
	me.id_internal	 	= '';
	me.pic				= '';
	me.active 			= 1;
	me.notes			= '';
	// define properties --end
	// call mandatory methods
	me.getIdInternal();
	me.configureOutletField();
	me.configureDatefield();
}
Pengiriman_sj_detail.prototype.initialize = function(){
	var me = this;
	// define properties
	me.id_purchase_ex 	= "item-"+Date.now().toString();
	me.datetime 		= ''; // new Date().format("yyyy-mm-dd HH:mm:ss");
	me.id_purchase	 	= '';
	me.id_product		= '';
	me.qty	 			= 0;
	me.discount			= 0;
	me._void			= 0;
	me.complimentary	= 0;
	me.active			= 1;
	me.notes			= '';
	// define properties --end
	// call mandatory methods

}
// act as a contructor --end
// get internal id set by the session
Pengiriman_sj.prototype.getIdInternal = function(){
	var me = this;
	$.ajax({url		: './app/control/user_info.php',type:'GET',async:false,data:{},
		success	: function(datanya){ 
			me.aaaa = JSON.parse(datanya)[0];
	}, error: function(){
		console.error("error saat pengambilan data user.");	
	}});
}
// get internal id set by the session --end
// configure 'Tujuan Penerimaan' field
Pengiriman_sj.prototype.configureOutletField = function(){
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
			exeption = "Error! kesalahan server saat pengambilan data outlet.";
		}
	});
	// get list of outlets (table 'member') --end
	// configure autocomplete object
	$('#inputTujuanKirimsj').autocomplete({
    lookup: outletList,
    onSelect: function (suggestion) {
        //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
        $('#inputAlamatKirimsj').text();
    }
    // configure autocomplete object --end
});
}
// configure 'Tujuan Penerimaan' field --end
// configure datepicker object
Pengiriman_sj.prototype.configureDatefield = function(){
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
$(document).ready(function(){
	var kirim_baru = new Pengiriman_sj();
});
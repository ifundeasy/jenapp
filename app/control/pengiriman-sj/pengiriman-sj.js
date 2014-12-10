// define class
function Pengiriman_sj(){this.initialize()}
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
	me.setoutlets();
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
Pengiriman_sj.prototype.setoutlets = function(){
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
	$('#inputTujuanKirimsj').autocomplete({
    lookup: outletList,
    onSelect: function (suggestion) {
        //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
    }
});
}
// configure 'Tujuan Penerimaan' field --end
$(document).ready(function(){
	var kirim_baru = new Pengiriman_sj();
});
$(document).ready(function(){
	// konfigurasi tabel utama
	var t = $('#main-table-outlet').DataTable({
		"processing"	: true,
        "serverSide"	: true,
     	"scrollY"		: "300px",
        "scrollCollapse": true,
        "paging"		: false,
		"ajax"			: 
		{
			"url"		: "./app/control/outlet/outlet.php",
		}
	});
	// konfigurasi tabel utama --end
	function validate(_data){
		var exeption 	= '';
		var new_user 	= _data[0].value;
		var new_id 	 	= '';
		var new_pass 	= '';
		var new_date 	= new Date();
		var birth_date 	= new Date();
		var identify 	= Math.floor(Math.random() * 26).toString() + Date.now().toString();
		if(_data[1].value != _data[2].value){
			exeption = "Error! konfirmasi password tidak sesuai.";
		} else {
			// kirim data ke server untuk verifikasi
			$.ajax({
				url		: './server/api/contact',
				type	: 'GET',
				async	: false,
				data 	: {
					f0_n: 'user_name', 
					f0_l: '=', 
					f0_v: new_user
				},
				success	: function(data, status, xhr){
					console.log("verifikasi 'user_name' :");
					console.log(JSON.parse(xhr.responseText));
					if(JSON.parse(xhr.responseText).data.length != 0){
						exeption = "Error! username telah terdaftar.";
					}
				},
				error : function(xhr, status, err){
					exeption = "Error! kesalahan server saat verifikasi.";
				}
			});
			// kirim data ke server untuk verifikasi --end
		}
		if (exeption == ""){
			//hash request
			$.ajax({url		: './app/control/simple_hash.php',type:'POST',async:false,data:{user_pass:_data[1].value},
				success	: function(hash_data){ 
					console.log("hashing...");
					new_pass=hash_data;
				},
				error : function(xhr, status, err){
					exeption = "Error! kesalahan server saat generate hash.";
			}});
			// generate new id

			new_id = new_user.substring(0, 3) + identify;
			// kirim data untuk disimpan di 'contact'
			$.ajax({
				url		: './server/api/contact',
				type	: 'POST',
				async	: false,
				data 	: {
					id_contact		: new_id,
					pin 			: '',
					user_name 		: new_user,
					user_pass 		: new_pass,
					first_name		: _data[3].value,
					registered 		: new_date.format("yyyy-mm-dd HH:mm:ss"), //kalo mau pake waktu server, kosong aja
					date_of_birth	: birth_date.format('yyyy-mm-dd'),
					allow_access 	: 1,
					active 			: 1
				},
				success: function(data, status, xhr){
					console.log("data 'contact' :");
					console.log(JSON.parse(xhr.responseText));
					// kirim data untuk disimpan di 'outlet' (member == outlet)
					$.ajax({
						url		: './server/api/member',
						type	: 'POST',
						async	: false,
						data 	: {
							id_member			: new_user,
							'fk.id_contact' 	: new_id,
							'fk.id_member_group': 'outlet',
							registered 			: new_date.format("yyyy-mm-dd HH:mm:ss"), //kalo mau pake waktu server, kosong aja
							notes 				: _data[7].value,
							active 				: 1
						},
						success: function(data, status, xhr){
							console.log("data 'member' :");
							console.log(JSON.parse(xhr.responseText));
							// simpan data tambahan alamat
							var idCity = _data[5].value;
							$.ajax({
								url		: './server/api/contact_addr',
								type	: 'POST',
								async	: false,
								data 	: {
									'fk.id_contact' : new_id,
									'fk.id_city'	: idCity,
									address			: _data[4].value,
									zip_code 		: _data[6].value,
									active 			: 1
								},
								success: function(data, status, xhr){
									console.log('address saved');
								},
								error : function(xhr, status, err){
									exeption = "Error! kesalahan server saat penyimpanan data [addr].";
								}
							});
							// simpan data tambahan alamat --end
						},
						error: function(xhr, status, err){
							exeption = "Error! kesalahan server saat penyimpanan data [1].";
						}
					});
					// kirim data untuk disimpan di 'outlet' (member == outlet) --end
				},
				error: function(xhr, status, err){
					exeption = "Error! kesalahan server saat penyimpanan data [0].";
				}
			});
			// kirim data untuk disimpan di 'contact' --end
		}
		console.log(exeption);
		// tampilkan pesan error selama 3 detik
		if (exeption != ""){
			$('#outlet-error-message').text(exeption);
			$('#outlet-form-gagal').removeClass("hide");
			$('html,body').animate({
			   scrollTop: $("#outlet-form-gagal").offset().top - 100
			}, 1000);
			setTimeout(function(){
				$('#outlet-error-message').text(null);
				$('#outlet-form-gagal').addClass("hide");
			}, 4000);
		// tampilkan pesan error selama 3 detik --end
		} else {
			// tampilkan pesan sukses
			$('#outlet-form-sukses').removeClass("hide");
			$('html,body').animate({
			   scrollTop: $('#outlet-form-sukses').offset().top - 100
			}, 1000);
			setTimeout(function(){
				$('#outlet-form-sukses').addClass("hide");
				//$('#reset-form-outlet').trigger('click');
				location.reload();
			}, 2000);
			// tampilkan pesan sukses --end
		}
	}
	// kontroller untuk tombol tambah data
	$('#tambah-data-outlet').click(function(){
		$('#form-outlet').toggleClass("hide", "");
		$('#tambah-data-outlet').hide();
	});
	// kontroller untuk tombol tambah data --end
	// kontroller untuk tombol reset
	$('#reset-form-outlet').click(function(){
		$('#form-outlet').addClass("hide");
		$('#tambah-data-outlet').show();
	});
	// kontroller untuk tombol reset --end
	// kontoller untuk tombol submit (override default behaviour)
	$('#form-outlet form').submit(function( event ) {
		$('#submit-form-outlet').toggleClass("disabled");
		$('#reset-form-outlet').toggleClass("disabled");
	  	var formdata = $('#form-outlet form').serializeArray();
	  	validate(formdata);
	  	event.preventDefault();
		$('#submit-form-outlet').toggleClass("disabled");
		$('#reset-form-outlet').toggleClass("disabled");
	});
	// kontoller untuk tombol submit (override default behaviour) --end
	// request list grup kota
	$.ajax({
		url		: './server/api/city',
		type	: 'GET',
		async	: false,
		data 	: {},
		success: function(data, status, xhr){
			console.log("data 'city' :");
			var list = JSON.parse(xhr.responseText);
			console.log(list);
			for(i=0; i<list.total; i++){
				$('#list-kota-outlet').append('<li><a key="'+ list.data[i].id_city +'">'+ list.data[i].name +'</a></li>');
			};
		},
		error : function(xhr, status, err){
			alert('kesalahan server. Mohon reload halaman.'	);
		}
	});
	// request list grup kota --end
	// controller untuk combobox umum (format seragam)
	$('[combobox] a').click(function(event){
		var me = $(event.target);
		var cmb = me.closest('div[combobox]');
		cmb.find('button div[display]').html(me.html());
		cmb.find('input').val(me.attr('key'));
	});
	// controller untuk combobox umum (format seragam) --end
	$('[combobox] a[key="43501c7e"]').trigger('click');
});
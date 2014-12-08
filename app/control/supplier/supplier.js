$(document).ready(function(){
	// konfigurasi tabel utama
	var t = $('#main-table-supplier').DataTable({
		"processing"	: true,
        "serverSide"	: true,
     	"scrollY"		: "300px",
        "scrollCollapse": true,
        "paging"		: false,
		"ajax"			: 
		{
			"url"		: "./app/control/supplier/supplier.php",
		}
	});
	// konfigurasi tabel utama --end
	// fungsi untuk validasi data baru
	function validate(_data){
		var exeption 	= '';
		var new_user 	= _data[0].value;
		var new_id 	 	= '';
		var new_pass 	= '';
		var new_date 	= new Date();
		// cek konfirmasi password
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
					exeption = "Error! kesalahan server saat request hash.";
			}});
			new_id = new_user.substring(0, 3) + Math.floor(Math.random() * 26).toString() + Date.now().toString();
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
					genre 			: 'L',
					notes			: _data[8].value,
					allow_access 	: 1,
					active 			: 1
				},
				success: function(data, status, xhr){
					console.log("data 'contact' :");
					console.log(JSON.parse(xhr.responseText));
					// kirim data untuk disimpan di 'supplier'
					$.ajax({
						url		: './server/api/supplier',
						type	: 'POST',
						async	: false,
						data 	: {
							id_supplier				: "supplier"+new_user,
							'fk.id_contact' 		: new_id,
							'fk.id_branch' 			: _data[4].value,
							'fk.id_supplier_group'	: _data[5].value,
							registered 				: new_date.format("yyyy-mm-dd HH:mm:ss"), //kalo mau pake waktu server, kosong aja
							active 					: 1,
							notes 					: _data[8].value
						},
						success: function(data, status, xhr){
							console.log("data 'supplier' :");
							console.log(JSON.parse(xhr.responseText));
							// simpan data tambahan email
							if(_data[7].value != ""){
								console.log('inserting additional data...');
								$.ajax({
									url		: './server/api/social',
									type	: 'GET',
									async	: false,
									data 	: {
										f0_n: 'name', 
										f0_l: '=', 
										f0_v: 'Email'
									},
									success: function(data, status, xhr){
										var idSocial = JSON.parse(xhr.responseText).data[0].id_social;
										$.ajax({
											url		: './server/api/contact_ex',
											type	: 'POST',
											async	: false,
											data 	: {
												'fk.id_contact' : new_id,
												'fk.id_social'	: idSocial,
												value			: _data[7].value,
												active 			: 1
											},
											success: function(data, status, xhr){
												console.log("data 'email' :");
												console.log(JSON.parse(xhr.responseText));
												// simpan data tambahan alamat
												if(_data[6].value != ""){
													console.log('inserting additional data...');
													$.ajax({
														url		: './server/api/city',
														type	: 'GET',
														async	: false,
														data 	: {
															f0_n: 'name', 
															f0_l: '=', 
															f0_v: 'Bandung' //nanti diganti dengan isi combobox
														},
														success: function(data, status, xhr){
															var idCity = JSON.parse(xhr.responseText).data[0].id_city;
															$.ajax({
																url		: './server/api/contact_addr',
																type	: 'POST',
																async	: false,
																data 	: {
																	'fk.id_contact' : new_id,
																	'fk.id_city'	: idCity,
																	address			: _data[6].value,
																	active 			: 1
																},
																success: function(data, status, xhr){
																	console.log('address saved');
																},
																error : function(xhr, status, err){
																	exeption = "Error! kesalahan server saat penyimpanan data [5].";
																}
															});
														},
														error : function(xhr, status, err){
															exeption = "Error! kesalahan server saat penyimpanan data [4].";
														}
													});
												}
												// simpan data tambahan alamat --end
											},
											error : function(xhr, status, err){
												exeption = "Error! kesalahan server saat penyimpanan data [3].";
											}
										});
									},
									error : function(xhr, status, err){
										exeption = "Error! kesalahan server saat penyimpanan data [2].";
									}
								});
							}
							// simpan data tambahan email --end
						},
						error : function(xhr, status, err){
							exeption = "Error! kesalahan server saat data [1].";
						}
					});
					// kirim data untuk disimpan di 'supplier' --end
				},
				error : function(xhr, status, err){
					exeption = "Error! kesalahan server saat penyimpanan data [0].";
				}
			});
			// kirim data untuk disimpan di 'contact' --end
		}
		// tampilkan pesan error selama 3 detik
		if (exeption != ""){
			$('#supplier-error-message').text(exeption);
			$('#supplier-form-gagal').removeClass("hide");
			$('html,body').animate({
			   scrollTop: $("#supplier-form-gagal").offset().top - 100
			}, 1000);
			setTimeout(function(){
				$('#supplier-error-message').text(null);
				$('#supplier-form-gagal').addClass("hide");
			}, 4000);
		// tampilkan pesan error selama 3 detik --end
		} else {
			// tampilkan pesan sukses
			$('#supplier-form-sukses').removeClass("hide");
			$('html,body').animate({
			   scrollTop: $('#supplier-form-sukses').offset().top - 100
			}, 1000);
			setTimeout(function(){
				$('#supplier-form-sukses').addClass("hide");
				//$('#reset-form-supplier').trigger('click');
				location.reload();
			}, 2000);
			// tampilkan pesan sukses --end
		}
	}
	// fungsi untuk validasi data baru --end
	// request list cabang
	$.ajax({
		url		: './server/api/branch',
		type	: 'GET',
		async	: false,
		data 	: {},
		success: function(data, status, xhr){
			console.log("data 'branch' :");
			var list = JSON.parse(xhr.responseText);
			console.log(list);
			for(i=0; i<list.total; i++){
				$('#list-cabang-supplier').append('<li><a key="'+ list.data[i].id_branch +'">'+ list.data[i].name +'</a></li>');
			};
		},
		error : function(xhr, status, err){
			alert('kesalahan server. Mohon reload halaman.');
		}
	});
	// request list cabang --end
	// request list grup supplier
	$.ajax({
		url		: './server/api/supplier_group',
		type	: 'GET',
		async	: false,
		data 	: {},
		success: function(data, status, xhr){
			console.log("data 'supplier group' :");
			var list = JSON.parse(xhr.responseText);
			console.log(list);
			for(i=0; i<list.total; i++){
				$('#list-grup-supplier').append('<li><a key="'+ list.data[i].id_supplier_group +'">'+ list.data[i].name +'</a></li>');
			};
		},
		error : function(xhr, status, err){
			alert('kesalahan server. Mohon reload halaman.');
		}
	});
	// request list grup supplier --end
	// controller untuk combobox umum (format seragam)
	$('[combobox] a').click(function(event){
		var me = $(event.target);
		var cmb = me.closest('div[combobox]');
		cmb.find('button div[display]').html(me.html());
		cmb.find('input').val(me.attr('key'));
	});
	// controller untuk combobox umum (format seragam) --end
	// kontroller untuk tombol tambah data
	$('#tambah-data-supplier').click(function(){
		$('#form-supplier').toggleClass("hide", "");
		$('#tambah-data-supplier').hide();
	});
	// kontroller untuk tombol tambah data --end
	// kontroller untuk tombol reset
	$('#reset-form-supplier').click(function(){
		$('#form-supplier').addClass("hide");
		$('#tambah-data-supplier').show();
	});
	// kontroller untuk tombol reset --end
	// kontoller untuk tombol submit (override default behaviour)
	$('#form-supplier form').submit(function( event ) {
		$('#submit-form-supplier').toggleClass("disabled");
		$('#reset-form-supplier').toggleClass("disabled");
	  	var formdata = $('#form-supplier form').serializeArray();
	  	validate(formdata);
	  	event.preventDefault();
	  	$('#submit-form-supplier').toggleClass("disabled");
		$('#reset-form-supplier').toggleClass("disabled");
	});
	// kontoller untuk tombol submit (override default behaviour) --end
});
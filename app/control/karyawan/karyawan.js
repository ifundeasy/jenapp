$(document).ready(function () {
	// konfigurasi tabel utama
	var t = $('#main_table').DataTable({
		"processing"	: true,
        "serverSide"	: true,
     	"scrollY"		: "300px",
        "scrollCollapse": true,
        "paging"		: false,
		"ajax"			: 
		{
			"url"		: "./app/control/karyawan/karyawan.php",
		}
	});
	// konfigurasi tabel utama --end
	//
	$('.date').datepicker({
	    format: 'dd-mm-yyyy',
	    weekStart: 1,
	    multidate: false,
	    autoclose: true,
	    startDate: '01-01-1930',
	    endDate: '01-01-2004',
	    startView: 2
	});
	$('.date').datepicker('update', '01-01-1990');
	//
	// fungsi untuk validasi data baru
	function validate(_data){
		var exeption 	= '';
		var new_user 	= _data[0].value;
		var new_id 	 	= '';
		var new_pass 	= '';
		var new_date 	= new Date();
		var birth_date 	= new Date($('#form-karyawan form').serializeArray()[7].value);
		console.log("new_date");
		console.log(new_date);
		console.log("birth_date");
		console.log(birth_date);
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
					exeption = "Error! kesalahan server saat generate hash.";
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
					last_name 		: _data[4].value,
					registered 		: new_date.format("yyyy-mm-dd HH:mm:ss"), //kalo mau pake waktu server, kosong aja
					date_of_birth	: birth_date.format('yyy-mm-dd'),
					genre 			: _data[8].value,
					notes			: _data[9].value,
					allow_access 	: 1,
					active 			: 1
				},
				success	: function(data, status, xhr){
					console.log("data 'contact' :");
					console.log(JSON.parse(xhr.responseText));
					// kirim data untuk disimpan di 'internal'
					$.ajax({
						url		: './server/api/internal',
						type	: 'POST',
						async	: false,
						data 	: {
							id_internal		: "internal"+new_user,
							'fk.id_contact' : new_id,
							registered 		: new_date.format("yyyy-mm-dd HH:mm:ss"), //kalo mau pake waktu server, kosong aja
							active 			: 1
						},
						success: function(data, status, xhr){
							console.log("data 'internal' :");
							console.log(JSON.parse(xhr.responseText));
							// simpan data tambahan email
							if(_data[6].value != ""){
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
												value			: _data[6].value,
												active 			: 1
											},
											success: function(data, status, xhr){
												console.log('email saved');
												
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
							exeption = "Error! kesalahan server saat penyimpanan data [1].";
						}
					});
					// kirim data untuk disimpan di 'internal' --end
				},
				error : function(xhr, status, err){
					exeption = "Error! kesalahan server saat penyimpanan data [0].";
				}
			});
			// kirim data untuk disimpan di 'contact' --end
		}
		console.log(exeption);
		// tampilkan pesan error selama 3 detik
		if (exeption != ""){
			$('#karyawan-error-message').text(exeption);
			$('#karyawan-form-gagal').removeClass("hide");
			$('html,body').animate({
			   scrollTop: $("#karyawan-form-gagal").offset().top - 100
			}, 1000);
			setTimeout(function(){
				$('#karyawan-error-message').text(null);
				$('#karyawan-form-gagal').addClass("hide");
			}, 4000);
		// tampilkan pesan error selama 3 detik --end
		} else {
			// tampilkan pesan sukses
			$('#karyawan-form-sukses').removeClass("hide");
			$('html,body').animate({
			   scrollTop: $('#karyawan-form-sukses').offset().top - 100
			}, 1000);
			setTimeout(function(){
				$('#karyawan-form-sukses').addClass("hide");
				//$('#reset-form-karyawan').trigger('click');
				location.reload();
			}, 2000);
			// tampilkan pesan sukses --end
		}
	}
	// fungsi untuk validasi data baru --end
	// kontroller untuk gender
	$('#gender-l').click(function(){
		$('#InputGender').text("L");
		$('[display]').text("Laki-laki");
	});
	$('#gender-p').click(function(){
		$('#InputGender').text("P");
		$('[display]').text("Perempuan");
	});
	// kontroller untuk gender --end
	// kontroller untuk tombol tambah data
	$('#tambah-data').click(function(){
		$('#form-karyawan').toggleClass("hide", "");
		$('#tambah-data').hide();
	});
	// kontroller untuk tombol tambah data --end
	// kontroller untuk tombol reset
	$('#reset-form-karyawan').click(function(){
		$('#form-karyawan').addClass("hide");
		$('#tambah-data').show();
	});
	// kontroller untuk tombol reset --end
	// kontoller untuk tombol submit (override default behaviour)
	$('#form-karyawan form').submit(function( event ) {
		$('#submit-form-karyawan').toggleClass("disabled");
		$('#reset-form-karyawan').toggleClass("disabled");
	  	var formdata = $('#form-karyawan form').serializeArray();
	  	validate(formdata);
	  	event.preventDefault();
		$('#submit-form-karyawan').toggleClass("disabled");
		$('#reset-form-karyawan').toggleClass("disabled");
	});
	// kontoller untuk tombol submit (override default behaviour) --end
});
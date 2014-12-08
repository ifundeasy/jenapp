/**
 * Created by rappresent on 11/22/14.
 */
Ajax('get', './server/api/level', {}, function (jqXHR, textStatus) {
	var group;
	try {
		group = JSON.parse(jqXHR.responseText)
	} catch (e) {
	}

	if (group) {
		Ajax('get', './server/custom/harga', {}, function (jqXHR, textStatus) {
			var datatable;

			try {
				datatable = JSON.parse(jqXHR.responseText)
			} catch (e) {
			}

			if (datatable) {
				new addTab(group.data, datatable.data);
			}
		});
	}
});

function addTab(group, datatable) {
	var parent = $('div[page="i-barang"]');
	var tab = parent.find('ul.nav.nav-tabs');

	tab.html('');
	//parent.find('select').html('');

	group.forEach(function (data, i) {
		tab.append('<li role="presentation"><a data-id=' + data.id_level + ' data-name="'+data.name+'">' + data.name.toTitleCase() + '</a></li>');
		parent.find('div[tables]').append('<table id=' + data.id_level + ' class="table table-striped table-bordered table-hover dt-responsive"></table>')
	});
	datatable.forEach(function(item){
		//parent.find('select').append('<option value='+ item.id_product +'>'+ item.name +'</option>')
	});

	//parent.find('select').bootstrapDualListbox();

	parent.find('[todo="submit"]').off('click');
	parent.find('[todo="submit"]').on('click', submit);

	function submit () {
		var done = [false, false, false];
		var date = new Date();
		var datetime = date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate()+' '+date.getHours()+'-'+date.getMinutes()+'-'+date.getSeconds();
		//var components = $('select[name="duallistbox"]').val();

		Ajax('post', './server/api/product', {
			"id_product" : parent.find("form [name='id_product']").val(),
			"datetime" : datetime,
			"fk.id_level" : parent.find('form').attr('todo'),
			"name" : parent.find("form [name='name']").val(),
			"active" : "1"
		}, function (jqXHR, textStatus) {
			/*
			components.forEach(function(item,i) {
				Ajax('post', './server/api/product_ex', {
					"fk.id_product" : parent.find("form [name='id_product']").val(),
					"fk.id_product_component" : item,
					"active" : "1"
				});
			});
			*/
			done[0] = true;
		});
		Ajax('post', './server/api/product_purchase_price', {
			"fk.id_product" : parent.find("form [name='id_product']").val(),
			"value" : parent.find("form [name='purchase_price']").val(),
			"active" : "1"
		}, function () {
			done[1] = true;
		});

		Ajax('post', './server/api/product_sale_price', {
			"fk.id_product" : parent.find("form [name='id_product']").val(),
			"value" : parent.find("form [name='sales_price']").val(),
			"active" : "1"
		}, function () {
			done[2] = true;
		});

		var z = setInterval(function(){
			if (done.indexOf(false) == -1) {
				clearInterval(z);

				window.location.reload();
			}
		});
	};
	parent.delete = function(event){
		var value = $(event.target).attr('row');
		$(event.target).parent().parent().parent().remove();
		Ajax('delete', './server/api/product/id_product/'+ value, {})
	};
	parent.hideCompoents = function (event) {
		$(event.target).parent().parent().hide();
		parent.find('div[for="table"]').show();
		parent.find('ul#tab').show();
	};
	parent.showCompoents = function (event) {
		var units;
		var products;
		var productTo = $(event.target).attr('row');
		var cmpContainer = parent.find('div[for="component"]');
		var cmpContainerForm = parent.find('div[for="component"] form');
		var cmpContainerFooter = parent.find('div[for="component"] div[footer]');
		var FOCUSAT = undefined;
		var REMOVE = [];
		var ADD = [];

		parent.find('div[for="table"]').hide();
		parent.find('ul#tab').hide();

		cmpContainer.show();
		cmpContainerForm.parent().show();

		function getFocus(event){
			FOCUSAT = event.target;
		}

		function setInputAttr(focus, data, keys){
			var value = data[keys[0]];
			var display = data[keys[1]];

			console.log(value, display);
			console.log(data);
			$(focus).attr("value", display);
			$(focus).attr("data", value);
		}

		function deleteComponent(event){
			var id = $(event.target).parent().attr('row');
			if (id) REMOVE.push(id);
			$(event.target).parent().remove();
		}

		function submitComponent() {
			var rows = cmpContainerForm.find('div[row]');

			REMOVE.forEach(function(id){
				Ajax('delete', './server/api/product_ex/id_product_ex/'+ id, {});
			});

			$.each(rows, function(i, row) {
				var id = $(row).attr('row');
				var data = {
					"fk.id_product" : productTo,
					"fk.id_product_component" : $(row).find('input[name="fk.id_product_component"]').attr('data'),
					"qty" : $(row).find('input[name="qty"]').val(),
					"fk.id_unit" : $(row).find('input[name="fk.id_unit"]').attr('data'),
					"cost" : $(row).find('input[name="cost"]').val()
				};

				if (id) {
					Ajax('put', './server/api/product_ex/id_product_ex/'+ id, data, function(){});
				} else {
					Ajax('post', './server/api/product_ex/', data, function(){});
				}
			});

			window.location.reload();
		}

		Ajax('get', './server/api/unit', {}, function(jqXHR, textStatus) {
			units = JSON.parse(jqXHR.responseText).data;
			units.forEach(function(unit, i){
				unit.value = unit.id_unit;
				unit.data = unit.id_unit;
			});
			Ajax('get', './server/api/product', {}, function(jqXHR, textStatus) {
				products = JSON.parse(jqXHR.responseText).data;
				products.forEach(function(prod, i){
					prod.value = prod.name;
					prod.data = prod.id_product;

					if (i == products.length-1) {
						Ajax('get', './server/api/product_ex', {f0_n:"fk.id_product", f0_l:"=", f0_v:productTo}, function(jqXHR, textStatus) {
							var response = JSON.parse(jqXHR.responseText);

							cmpContainer.find('h2').html(products.filter(function(data){
								return (data.id_product === productTo)
							})[0].name);

							cmpContainerForm.html("");
							cmpContainerFooter.html("");
							response.data.forEach(function(data, i){
								products.filter(function(data){
									return data
								});
								var cmp = products.filter(function(d){
									return (d.id_product == data['fk.id_product_component'])
								});

								if (cmp.length == 1) {
									var row = '<div style="margin-bottom: 5px;" row="'+ data.id_product_ex +'">' +
										'<input style="margin-right: 5px; width: 300px;" type="text" class="input-sm" name="fk.id_product_component" data="'+ data["fk.id_product_component"] +'" placeholder="Component" value="'+ cmp[0].name +'">' +
										'<input style="margin-right: 5px; width: 100px;" type="text" class="input-sm" name="qty" data="'+ data["qty"] +'" placeholder="Qty" value="'+ data['qty'] +'">' +
										'<input style="margin-right: 5px; width: 80px;" type="text" class="input-sm" name="fk.id_unit" data="'+ data["fk.id_unit"] +'" placeholder="Unit" value="'+ data['fk.id_unit'] +'">' +
										'<input style="margin-right: 5px; width: 150px;" type="text" class="input-sm" name="cost" data="'+ data["cost"] +'" placeholder="Total Cost" value="'+ data['cost'] +'">' +
										'<input todo="delete" type="button" class="btn btn-sm btn-danger" value="Delete">' +
										'</div>';
									cmpContainerForm.append(row);

									cmpContainerForm.find('input[name]').unbind('focus', getFocus);
									cmpContainerForm.find('input[name]').bind('focus', getFocus);
								}
							});

							cmpContainerFooter.append('<input todo="add" style="margin-right: 5px;" type="button" class="btn btn-md btn-success" value="Add">');
							cmpContainerFooter.append('<input todo="close" style="margin-right: 5px;" type="button" class="btn btn-md btn-default" value="Close">');
							cmpContainerFooter.append('<input todo="submit" style="margin-right: 5px;" type="button" class="btn btn-md btn-warning" value="Submit">');

							cmpContainerFooter.find('input[todo="add"]').on('click', function(event){
								var row = '<div style="margin-bottom: 5px;" row="">' +
									'<input style="margin-right: 5px; width: 300px;" type="text" class="input-sm" name="fk.id_product_component" data="" placeholder="Component">' +
									'<input style="margin-right: 5px; width: 100px;" type="text" class="input-sm" name="qty" data="" placeholder="Qty">' +
									'<input style="margin-right: 5px; width: 80px;" type="text" class="input-sm" name="fk.id_unit" data="" placeholder="Unit">' +
									'<input style="margin-right: 5px; width: 150px;" type="text" class="input-sm" name="cost" data="" placeholder="Total Cost">' +
									'<input todo="delete" type="button" class="btn btn-sm btn-danger" value="Delete">' +
									'</div>';
								cmpContainerForm.append(row);

								cmpContainerForm.find('input[name]').unbind('focus', getFocus);
								cmpContainerForm.find('input[name]').bind('focus', getFocus);
								cmpContainerForm.find('input[todo="delete"]').unbind('click', deleteComponent);
								cmpContainerForm.find('input[todo="delete"]').bind('click', deleteComponent);
								cmpContainerForm.find('input[name="fk.id_unit"]').autocomplete({
									lookup: units,
									onSelect: function (suggestion) {
										setInputAttr(FOCUSAT, suggestion, ["id_unit", "id_unit"]);
									}
								});
								cmpContainerForm.find('input[name="fk.id_product_component"]').autocomplete({
									lookup: products,
									onSelect: function (suggestion) {
										setInputAttr(FOCUSAT, suggestion, ["id_product", "name"]);
									}
								});
							});

							cmpContainerForm.find('input[todo="delete"]').unbind('click', deleteComponent);
							cmpContainerForm.find('input[todo="delete"]').bind('click', deleteComponent);

							cmpContainerFooter.find('input[todo="close"]').unbind('click', parent.hideCompoents);
							cmpContainerFooter.find('input[todo="close"]').bind('click', parent.hideCompoents);
							cmpContainerForm.find('input[name="fk.id_unit"]').autocomplete({
								lookup: units,
								onSelect: function (suggestion) {
									setInputAttr(FOCUSAT, suggestion, ["id_unit", "id_unit"]);
								}
							});
							cmpContainerForm.find('input[name="fk.id_product_component"]').autocomplete({
								lookup: products,
								onSelect: function (suggestion) {
									setInputAttr(FOCUSAT, suggestion, ["id_product", "name"]);
								}
							});

							cmpContainerFooter.find('input[todo="submit"]').unbind('click', submitComponent);
							cmpContainerFooter.find('input[todo="submit"]').bind('click', submitComponent);
						})
					}
				});
			});
		});
	};

	tab.find('li').bind('click', function (event) {
		var target = $(event.target);
		var dataId = target.attr('data-id');
		var dataName = target.attr('data-name');
		var data = datatable.filter(function (obj) {
			return obj.type == dataName
		});

		tab.find('li').removeClass('active');
		target.parent().addClass('active');

		new organizeData(dataId, data, parent);
	});
}

function organizeData(groupId, data, parent) {
	var selector = 'div#'+ groupId + '_wrapper';

	parent.find('div[tables]>table').show();
	parent.find('div[tables]>div').hide();

	if ($(selector).length > 0) {
		parent.find(selector).show();
		parent.find('form').parent().hide();
	} else {
		data.forEach(function(item){
			item.actions = '<div class="btn-group btn-group-sm" role="group">' +
				'<button type="button" row='+ item.id_product +' todo="info" class="btn btn-info">Info</button>' +
				'<button type="button" row='+ item.id_product +' todo="delete" class="btn btn-danger">Delete</button>' +
				'</div>';
			item.harga_jual = item.harga_jual || 0;
			item.harga_beli = item.harga_beli || 0;
			item.harga_jual = '<div value='+ item.harga_jual +'>'+ item.harga_jual.toString().numberWithCommas() +'</div>';
			item.harga_beli = '<div value='+ item.harga_beli +'>'+ item.harga_beli.toString().numberWithCommas() +'</div>';
		});
		$('#' + groupId).dataTable({
			"data"   : data,
			"columns": [
				{
					"title": "Code",
					"data": "id_product"
				},
				{
					"title": "Name",
					"data": "name"
				},
				{
					"title": "Purchase",
					"data": "harga_beli",
					"class": "right"
				},
				{
					"title": "Sales",
					"data": "harga_jual",
					"class": "right",
					"style"   : "text-align:right;"
				},
				{
					"title": "Action",
					"data": "actions",
					"class": "right"
				}
			]
		});
		$(parent.find(selector).find('label')[0]).prepend('<button todo="new" value='+ groupId +' class="btn btn-sm btn-success" style="margin-right: 5px;">New</button>');
	}

	var i = 0, z = setInterval(function(){
		parent.find('button[todo="delete"]').unbind('click', parent.delete);
		parent.find('button[todo="delete"]').bind('click', parent.delete);
		parent.find('button[todo="info"]').unbind('click', parent.showCompoents);
		parent.find('button[todo="info"]').bind('click', parent.showCompoents);
		if (i > 50) {
			clearInterval(z);
		}
		i++
	}, 200);

	parent.find("button[todo='new']").bind('click', function(event){
		parent.find('form').attr('todo', $(event.target).attr('value'));
		parent.find('form').parent().show();
		parent.find('form>h1').html("New " + parent.find('ul#tab .active a').html())
		parent.find(selector).hide();
	});

	parent.find('[todo="cancel"]').on('click', function(){
		parent.find('form').parent().hide();
		parent.find('div[tables]>div').hide();
		parent.find(selector).show();
	});
	parent.find(selector).find('label select').css('margin-right', 5);
	parent.find(selector).find('label input').css('margin-left', 5);
}
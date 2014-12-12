/**
 * Created by rappresent on 12/7/14.
 */
function IOrderBeli() {
}

IOrderBeli.prototype.initialize = function () {
	var me = this;
	me.data = {};
	me.Date = new Date();
	me.date = this.Date.getFullYear() + "-" + this.Date.getMonth() + "-" + this.Date.getDate();
	me.module = $('div[page="i-orderbeli"]');
	me.elements = {
		containerNew        : {
			object: "#containerNew",
			config: [],
			events: []
		},
		containerSearch     : {
			object: "#containerSearch",
			config: [],
			events: []
		},
		tableOrderPembelian : {
			object: "#tableOrderPembelian",
			config: ["confTableOrderPembelian"],
			events: []
		},
		btnShowConNew       : {
			object: "#btnShowConNew",
			config: [],
			events: ["clickBtnShowConNew"]
		},
		btnShowConSearch    : {
			object: "#btnShowConSearch",
			config: [],
			events: ["clickBtnShowConSearch"]
		},
		btnAddProduct       : {
			object: "#btnAddProduct",
			config: [],
			events: ["clickBtnAddProduct"]
		},
		btnResetTrans       : {
			object: "#btnResetTrans",
			config: [],
			events: ["clickBtnResetTrans"]
		},
		btnSubmitTrans      : {
			object: "#btnSubmitTrans",
			config: [],
			events: ["clickBtnSubmitTrans"]
		},
		inputTransNumb      : {
			object: "#inputTransNumb",
			config: [],
			events: ["inputFocus", "changeInputTransNumb"]
		},
		inputDateTrans      : {
			object: "#inputDateTrans",
			config: ["confInputDateTrans"],
			events: ["inputSetDataValue"]
		},
		inputSupplier       : {
			object: "#inputSupplier",
			config: ["confInputSupplier"],
			events: ["inputFocus"]
		},
		inputSupplierAddr   : {
			object: "#inputSupplierAddr",
			config: [],
			events: []
		},
		inputProduct        : {
			object: "#inputProduct",
			config: ["confInputProduct"],
			events: ["inputFocus"]
		},
		inputProductQty     : {
			object: "#inputProductQty",
			config: [],
			events: ["inputSetDataValue"]
		},
		inputProductDiscount: {
			object: "#inputProductDiscount",
			config: [],
			events: ["inputSetDataValue"]
		},
		inputProductPrice   : {
			object: "#inputProductPrice",
			config: [],
			events: []
		},
		inputTax            : {
			object: "#inputTax",
			config: ["confInputTax"],
			events: ["inputSetDataValue"]
		},
		inputGrandTotal     : {
			object: "#inputGrandTotal",
			config: [],
			events: []
		},
		inputTotal          : {
			object: "#inputTotal",
			config: [],
			events: []
		},
		inputTotalQty       : {
			object: "#inputTotalQty",
			config: [],
			events: []
		},
		inputTotalItems     : {
			object: "#inputTotalItems",
			config: [],
			events: []
		},
		inputInternal       : {
			object: "#inputInternal",
			config: ["confInputInternal"],
			events: []
		},
		textareaNotes       : {
			object: "#textareaNotes",
			config: [],
			events: ["inputSetDataValue"]
		}
	};

	me.focusAt = "";

	me.ajax(me.prepare());
};

IOrderBeli.prototype.ajax = function (callback) {
	var cb, me = this;
	Ajax('get', './server/custom/harga', {}, function (jqXHR, textStatus, rawData) {
		if (rawData) me.data.product = rawData;

		rawData.forEach(function (raw, i) {
			raw.value = raw.name;
		});

		Ajax('get', './server/custom/supplier', {}, function (jqXHR, textStatus, rawData) {
			if (rawData) me.data.supplier = rawData;

			rawData.forEach(function (raw) {
				raw.value = raw.id_supplier
			});

			if (callback) {
				typeof callback == 'function' ? (cb = callback()) : (cb = callback);
				return cb;
			}
		});
	});
};

IOrderBeli.prototype.prepare = function () {
	var me = this;

	Object.keys(me.elements).forEach(function (key) {
		me.initEl(key, me.elements[key].object);
	});
	me.elements.containerSearch.object.hide();
	me.elements.containerNew.object.show();
};

IOrderBeli.prototype.initEl = function (key, object) {
	var me = this;
	var key = me.elements[key];
	if (me.module.length == 1) {
		if (me.module.find(object).length > 0) {
			key.object = me.module.find(object);
			if (typeof key.object !== "string") {
				key.object.unbind(); //remove all events handler

				if (key.config)
				key.config.forEach(function (name) {
					if (me[name]) {
						if (typeof me[name] == 'function') me[name](key.object, me.elements);
					} else {
						console.warn("IOrderBeli.prototype." + name + " is " + me[name]);
					}
				});

				if (key.events)
				key.events.forEach(function (name) {
					if (me[name]) {
						if (typeof me[name] == 'function') me[name](key.object, me.elements);
					} else {
						console.warn("IOrderBeli.prototype." + name + " is " + me[name]);
					}
				});

				return me.elements;
			}
		}
	}
};

IOrderBeli.prototype.clickBtnShowConSearch = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		elements.containerNew.object.hide();
		elements.containerSearch.object.show();
	});
};

IOrderBeli.prototype.clickBtnShowConNew = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		elements.containerSearch.object.hide();
		elements.containerNew.object.show();
	});
};

IOrderBeli.prototype.clickBtnAddProduct = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		var table = elements.tableOrderPembelian.object;
		var product = elements.inputProduct.object.data();
		var qty = elements.inputProductQty.object.data();
		var discount = elements.inputProductDiscount.object.data();
		var price = product.product_purchase_price;

		if (product.value && qty && discount && price) {
			var uuid = (new Date()).getTime();
			var tbody = table.find('tbody');
			var tr = table.find('tbody>tr').length + 1;
			var total = (qty.value * product.product_purchase_price) - (qty.value * product.product_purchase_price * discount.value / 100);
			var str = "<tr id=" + uuid + ">" +
				"<td align='center'>" + tr + "</td>" +
				"<td align='left'>" + product.value + "</td>" +
				"<td align='left'>" + product.display + "</td>" +
				"<td align='center'>" + qty.value + "</td>" +
				"<td align='right'>" + product.product_purchase_price + "</td>" +
				"<td align='right'>" + discount.value + "</td>" +
				"<td align='right'>" + total + "</td>" +
				"<td align='center'><input type='button' class='btn btn-sm btn-danger' value='Hapus'></td>" +
				"</tr>";

			tbody.append(str);

			tbody.find("#" + uuid).data({
				"id_product"               : product.value,
				"qty"                      : qty.value,
				"id_product_purchase_price": product.id_product_purchase_price,
				"product_purchase_price"   : product.product_purchase_price,
				"discount"                 : discount.value,
				"total"                    : total
			});

			tbody.find('input[type="button"]').off('click');
			tbody.find('input[type="button"]').on('click', function (event) {
				$(event.target).closest('tr').remove();

				me.calculate(elements);
				$.each(tbody.find("tr"), function (i, tr) {
					var row = $(tr).children().get(0);
					$(row).html(i + 1);
				});
			});

			me.calculate(elements);
		}
	});
};

IOrderBeli.prototype.calculate = function (elements) {
	var me = this;
	var products = [];
	var data = []; // jo, array ini buat apa ya? cuman di-push aja biar rame?
	var tax = elements.inputTax.object.data("value");
	var total = 0;
	var qty = 0;
	$.each(elements.tableOrderPembelian.object.find('tbody>tr'), function (i, tr) {
		total += $(tr).data("total");
		qty += $(tr).data("qty");
		data.push($(tr).data());
		products.push($(tr).data("id_product"))
	});

	elements.inputTotalQty.object.html(qty);
	elements.inputTotalItems.object.html(products.getUnique().length);
	elements.inputTotal.object.val(total);
	elements.inputGrandTotal.object.val(total + (total * tax / 100));
};

IOrderBeli.prototype.validate = function (elements) {
	var arr = [false, false, false, false, false, false];
	var valid = {
		inputTransNumb     : elements.inputTransNumb.object,
		inputDateTrans     : elements.inputDateTrans.object,
		inputInternal      : elements.inputInternal.object,
		inputSupplier      : elements.inputSupplier.object,
		inputTax           : elements.inputTax.object,
		tableOrderPembelian: elements.tableOrderPembelian.object.find('tbody>tr')
	};

	if (valid.inputTransNumb.data("valid")) arr[0] = true;
	if (valid.inputDateTrans.data()) arr[1] = true;
	if (valid.inputInternal.data("value")) arr[2] = true;
	if (valid.inputSupplier.data("value")) arr[3] = true;
	if (parseFloat(valid.inputTax.data("value"))) arr[4] = true;
	if (valid.tableOrderPembelian.length > 0) {
		if (valid.tableOrderPembelian.data("id_product")) arr[5] = true;
	}

	return [arr, valid];
};

IOrderBeli.prototype.clickBtnResetTrans = function (object, elements) {
	var me = this;

	object.off('click');
	object.on('click', function () {
		me.module.find('input[id][type!="button"][id!="inputDateTrans"]').val("");
		me.module.find('textarea[id]').val("");
		me.module.find('span[id]').html(0);
		me.confInputDateTrans(me.module.find("input#inputDateTrans"), elements);

		me.prepare();
	});
};

IOrderBeli.prototype.clickBtnSubmitTrans = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		var valid = me.validate(elements);
		if (valid[0].indexOf(false) == -1) {

			object.off('click'); //please wait! don't clicking again!

			AjaxSync("post", "./server/api/purchase", {
				"id_purchase"   : elements.inputTransNumb.object.data("value"),
				"datetime"      : elements.inputDateTrans.object.val(),
				"fk.id_internal": elements.inputInternal.object.data("value"),
				"pic"           : elements.inputSupplier.object.data("value"),
				"notes"         : elements.textareaNotes.object.data("value")
			}, function (jqXHR, b, c) {
				//console.log(jqXHR.responseJSON);
				if (jqXHR.responseJSON.success) {
					rows = elements.tableOrderPembelian.object.find('tbody>tr');

					$.each(rows, function (i, row) {
						date = new Date ();
						if ($(row).data("id_product")) {
							row = $(row).data();
							AjaxSync("post", "./server/api/purchase_ex", {
								"fk.id_purchase"              : elements.inputTransNumb.object.data("value"),
								"datetime"                    : dateFormat(date, "isoDate") + " " + dateFormat(date, "isoTime"),
								"fk.id_product"               : row.id_product,
								"qty"                         : parseFloat(row.qty),
								"fk.id_product_purchase_price": row.id_product_purchase_price,
								"discount"                    : parseFloat(row.discount),
								"active"                      : "1"
							}, function (jqXHR, b, c) {
								if (i == rows.length-1){
									alert("[Success : 001] Data tersimpan!");
									elements.btnResetTrans.object.trigger('click');
								}
							})
						}
					})
				}
			})
		} else {
			console.log(valid);
			alert("[Warning : 002] Maaf data anda tidak valid!");
		}
	});
};

IOrderBeli.prototype.inputFocus = function (object, elements) {
	var me = this;
	object.off('focus');
	object.on('focus', function () {
		me.focusAt = object;
	});
};

IOrderBeli.prototype.inputSetDataValue = function (object, elements) {
	var me = this;
	object.off('input');
	object.on('input', function () {
		object.data("value", object.val())
		me.calculate(elements);
	});
};

IOrderBeli.prototype.changeInputTransNumb = function (object, elements) {
	var me = this;
	object.off('input');
	object.on('input', function () {
		if (object.val())
			Ajax('get', './server/api/purchase/' + object.val(), {}, function (jq, res, data) {
				if (data.length == 0) {
					object.parent().removeClass("has-error");
					object.parent().addClass("has-success");
					object.data({
						"valid": true,
						"value": object.val()
					});
				} else {
					object.parent().removeClass("has-success");
					object.parent().addClass("has-error");
					object.data({
						"valid": false,
						"value": undefined
					});
				}
			})
	});
};

IOrderBeli.prototype.confInputTax = function (object, elements) {
	var me = this;
	object.val(10);
	object.data("value", 10);
};

IOrderBeli.prototype.confTableOrderPembelian = function (object, elements) {
	var me = this;
	object.find("tbody").html("");
	object.closest("div[panel]").closest('div.panel.panel-danger').find("a").trigger("click");
};

IOrderBeli.prototype.confInputDateTrans = function (object, elements) {
	var me = this;
	object.datepicker({
		weekStart         : 1,
		language          : "id",
		format            : "yyyy-mm-dd",
		daysOfWeekDisabled: "0",
		startDate         : me.date,
		multidate		  : false,
	    autoclose		  : true,
	});
	object.datepicker('update', me.date);
};

IOrderBeli.prototype.confInputSupplier = function (object, elements) {
	var me = this;
	var z = setInterval(function () {
		if (me.data.supplier) {
			clearInterval(z);
			object.autocomplete({
				lookup  : me.data.supplier,
				onSelect: function (suggestion) {
					function display() {
						var ret = "";
						if (suggestion.first_name) ret += suggestion.first_name + " ";
						if (suggestion.last_name) ret += suggestion.last_name;

						return ret;
					}

					object.data({
						value  : suggestion.id_supplier,
						display: display(),
						address: suggestion.address,
						city   : suggestion.city,
					});
					elements.inputSupplierAddr.object.val(suggestion.address + " " + suggestion.city);
				}
			});
		}
	}, 200)
};

IOrderBeli.prototype.confInputProduct = function (object, elements) {
	var me = this;
	var z = setInterval(function () {
		if (me.data.product) {
			clearInterval(z);
			var data = me.data.product.filter(function (data) {
				return data.id_product_purchase_price !== null
			});
			object.autocomplete({
				lookup  : data,
				onSelect: function (suggestion) {
					object.data({
						value                    : suggestion.id_product,
						display                  : suggestion.name,
						id_product_purchase_price: suggestion.id_product_purchase_price,
						product_purchase_price   : parseFloat(suggestion.product_purchase_price),
						id_product_sale_price    : suggestion.id_product_sale_price,
						product_sale_price       : parseFloat(suggestion.product_sale_price)
					});
					if (parseFloat(suggestion.product_purchase_price)) {
						elements.inputProductPrice.object.val(parseFloat(suggestion.product_purchase_price));

						elements.inputProductQty.object.val(1);
						elements.inputProductQty.object.data("value", 1);

						elements.inputProductDiscount.object.val(0);
						elements.inputProductDiscount.object.data("value", 0);
					} else {
						alert("[Warning : 001] Tidak dapat memilih barang ini, karena tidak memiliki harga jual!")
					}
				}
			});
		}
	}, 200)
};

IOrderBeli.prototype.confInputInternal = function (object, elements) {
	var me = this;
	object.val($('span#contact').html());
	object.data("value", Profile.internal.id_internal);
};

$(document).ready(function () {
	var iOrderBeli = new IOrderBeli();
	iOrderBeli.initialize();
});
/**
 * Created by rappresent on 12/11/14.
 */
function IPenerimaan() {
}

IPenerimaan.prototype.initialize = function () {
	var me = this;
	me.data = {};
	me.Date = new Date();
	me.date = this.Date.getFullYear() + "-" + this.Date.getMonth() + "-" + this.Date.getDate();
	me.module = $('div[page="i-penerimaan"]');
	me.elements = {
		containerNew       : {
			object: "#containerNew"
		},
		containerSearch    : {
			object: "#containerSearch"
		},
		btnShowConNew      : {
			object: "#btnShowConNew",
			events: ["clickBtnShowConNew"]
		},
		btnShowConSearch   : {
			object: "#btnShowConSearch",
			events: ["clickBtnShowConSearch"]
		},
		btnResetTrans      : {
			object: "#btnResetTrans",
			events: ["clickBtnResetTrans"]
		},
		btnSubmitTrans     : {
			object: "#btnSubmitTrans",
			events: ["clickBtnSubmitTrans"]
		},
		inputSupplier      : {
			object: "#inputSupplier",
			config: ["confInputSupplier"]
		},
		inputReference     : {
			object: "#inputReference"
		},
		inputOrderNumb     : {
			object: "#inputOrderNumb"
		},
		inputDateTrans     : {
			object: "#inputDateTrans",
			config: ["confInputDateTrans"],
			events: ["inputSetDataValue"]
		},
		inputTransNumb     : {
			object: "#inputTransNumb",
			events: ["changeInputTransNumb"]
		},
		inputTax           : {
			object: "#inputTax",
			config: ["confInputTax"],
			events: ["inputSetDataValue"]
		},
		inputGrandTotal    : {
			object: "#inputGrandTotal"
		},
		inputTotal         : {
			object: "#inputTotal"
		},
		inputTotalQty      : {
			object: "#inputTotalQty"
		},
		inputTotalItems    : {
			object: "#inputTotalItems"
		},
		inputInternal      : {
			object: "#inputInternal",
			config: ["confInputInternal"]
		},
		textareaNotes      : {
			object: "#textareaNotes",
			events: ["inputSetDataValue"]
		},
		tableOrderPembelian: {
			object: "#tableOrderPembelian",
			config: ["confTableOrderPembelian"]
		}
	};

	me.focusAt = "";

	me.ajax(me.prepare());
};

IPenerimaan.prototype.ajax = function (callback) {
	var cb, me = this;

	Ajax('get', './server/custom/supplier', {}, function (jqXHR, textStatus, rawData) {
		if (rawData) {
			me.data.supplier = rawData;

			rawData.forEach(function (raw) {
				raw.value = raw.id_supplier
			});
		}

		if (callback) {
			typeof callback == 'function' ? (cb = callback()) : (cb = callback);
			return cb;
		}
	});
};

IPenerimaan.prototype.prepare = function () {
	var me = this;

	Object.keys(me.elements).forEach(function (key) {
		me.initEl(key, me.elements[key].object);
	});

	me.elements.containerSearch.object.hide();
	me.elements.containerNew.object.show();
};

IPenerimaan.prototype.initEl = function (key, object) {
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
							console.warn("IPenerimaan.prototype." + name + " is " + me[name]);
						}
					});

				if (key.events)
					key.events.forEach(function (name) {

						if (me[name]) {
							if (typeof me[name] == 'function') me[name](key.object, me.elements);
						} else {
							console.warn("IPenerimaan.prototype." + name + " is " + me[name]);
						}
					});

				return me.elements;
			}
		}
	}
};

IPenerimaan.prototype.confInputTax = function (object, elements) {
	var me = this;
	object.val(10);
	object.data("value", 10);
};

IPenerimaan.prototype.confInputInternal = function (object, elements) {
	var me = this;
	object.val($('span#contact').html());
	object.data("value", Profile.internal.id_internal);
};

IPenerimaan.prototype.confInputSupplier = function (object, elements) {
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

					Ajax('get', './server/custom/purchase?id_supplier=' + suggestion.id_supplier, {}, function (jqXHR, success, data) {
						if ((typeof data == "object") && (data.length > 0)) {
							me.data.purchase = data;
							data.forEach(function (raw, i) {
								raw.value = raw.id_purchase;
								raw.data = raw.id_purchase;
							});

							elements.inputOrderNumb.object.removeAttr('disabled');
							me.confInputOrderNumb(elements.inputOrderNumb.object, elements)
						}
					});
					/*Ajax('get', './server/api/purchase', {
						f0_n: "pic",
						f0_l: "=",
						f0_v: suggestion.id_supplier
					}, function (jqXHR, textStatus, rawData) {
						if (rawData) {
							me.data.purchase = rawData;
							rawData.forEach(function (raw, i) {
								raw.value = raw.id_purchase;
								raw.data = raw.id_purchase;
							});

							elements.inputOrderNumb.object.removeAttr('disabled');
							me.confInputOrderNumb(elements.inputOrderNumb.object, elements)
						}
					});*/
				}
			});
		}
	}, 200)
};

IPenerimaan.prototype.confInputOrderNumb = function (object, elements) {
	var me = this;
	var z = setInterval(function () {
		if (me.data.purchase) {
			clearInterval(z);
			object.autocomplete({
				lookup  : me.data.purchase,
				onSelect: function (suggestion) {
					if (suggestion.id_purchase)
						Ajax('get', './server/custom/purchase_ex?id_purchase=' + suggestion.id_purchase, {}, function (jqXHR, success, data) {
							if ((typeof data == "object") && (data.length > 0)) {
								me.insertTable(data);
							}
						});
				}
			});
		}
	}, 200)
};

IPenerimaan.prototype.confInputDateTrans = function (object, elements) {
	var me = this;
	object.datepicker({
		weekStart         : 1,
		language          : "id",
		format            : "yyyy-mm-dd",
		daysOfWeekDisabled: "0",
		startDate         : me.date,
		multidate         : false,
		autoclose         : true,
	});
	object.datepicker('update', me.date);
};

IPenerimaan.prototype.confTableOrderPembelian = function (object, elements) {
	var me = this;
	object.find("tbody").html("");
	object.closest("div[panel]").closest('div.panel.panel-danger').find("a").trigger("click");
};

IPenerimaan.prototype.clickBtnShowConNew = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		elements.containerSearch.object.hide();
		elements.containerNew.object.show();
	});
};

IPenerimaan.prototype.clickBtnShowConSearch = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		elements.containerNew.object.hide();
		elements.containerSearch.object.show();
	});
};

IPenerimaan.prototype.clickBtnResetTrans = function (object, elements) {
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

IPenerimaan.prototype.clickBtnSubmitTrans = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		var valid = me.validate(elements);
		if (valid[0].indexOf(false) == -1) {

			object.off('click'); //please wait! don't clicking again!

			AjaxSync("post", "./server/api/purchase_bill", {
				"id_purchase_bill": elements.inputTransNumb.object.data("value"),
				"datetime"        : elements.inputDateTrans.object.val(),
				"fk.id_internal"  : elements.inputInternal.object.data("value"),
				"fk.id_supplier"  : elements.inputSupplier.object.data("value"),
				"alternative"     : elements.inputReference.object.val(),
				"tax_percent"     : elements.inputTax.object.data("value"),
				"active"          : "1",
				"notes"           : elements.textareaNotes.object.data("value")
			}, function (jqXHR, b, c) {
				//console.log(jqXHR.responseJSON);
				if (jqXHR.responseJSON.success) {
					rows = elements.tableOrderPembelian.object.find('tbody>tr');

					$.each(rows, function (i, row) {
						date = new Date();

						if ($(row).data("fk.id_product")) {
							row = $(row).data();
							AjaxSync("post", "./server/api/purchase_bill_ex", {
								"fk.id_purchase_bill"         : elements.inputTransNumb.object.data("value"),
								"fk.id_purchase_ex"           : row["id_purchase_ex"],
								"fk.id_product_purchase_price": row["fk.id_product_purchase_price"],
								"qty"                         : parseFloat(row.check),
								"discount_percent"            : parseFloat(row.discount),
								"active"                      : "1"
							}, function (jqXHR, b, c) {
								if (i == rows.length - 1) {
									alert("[Success : 001] Data tersimpan!");
									elements.btnResetTrans.object.trigger('click');
								}
							})
						}
					})
				}
			});
		} else {
			console.log(valid);
			alert("[Warning : 001] Maaf data anda tidak valid!");
		}
	});
};

IPenerimaan.prototype.defaultValue = function (elements) {
	elements.inputOrderNumb.object.attr('disabled', "");
};

IPenerimaan.prototype.inputSetDataValue = function (object, elements) {
	var me = this;
	object.off('input');
	object.on('input', function () {
		object.data("value", object.val());
		me.calculate(elements);
	});
};

IPenerimaan.prototype.changeInputTransNumb = function (object, elements) {
	var me = this;
	object.off('input');
	object.on('input', function () {
		object.parent().removeClass("has-success");
		object.parent().addClass("has-error");
		object.data({
			"valid": false,
			"value": undefined
		});

		if (object.val()) {
			Ajax('get', './server/api/purchase_bill/' + object.val(), {}, function (jq, res, data) {
				if (data.length == 0) {
					object.parent().removeClass("has-error");
					object.parent().addClass("has-success");
					object.data({
						"valid": true,
						"value": object.val()
					});
				}
			})
		}
	});
};

IPenerimaan.prototype.insertTable = function (dataArr) {
	var me = this;
	var table = me.elements.tableOrderPembelian.object;
	var tbody = table.find('tbody');
	var tr = table.find('tbody>tr').length + 1;
	dataArr.forEach(function (data, i) {
		var uuid = data["id_purchase_ex"];

		if (tbody.find("#" + uuid).length == 0) {
			var trans = data["fk.id_purchase"];
			var code = data["fk.id_product"];
			var name = data["name_product"];
			var qty = parseFloat(data["qty"]);
			var sum_qty = parseFloat(data["sum_qty"]);
			var harga = parseFloat(data["harga_beli"]);
			var diskon = parseFloat(data["discount"]);
			var total = (harga * qty) - (harga * qty * diskon / 100);

			if (qty > 0) {
				var str = "<tr id=" + uuid + ">" +
					"<td align='center'>" + tr++ + "</td>" +
					"<td align='left'>" + trans + "</td>" +
					"<td align='left'>" + code + "</td>" +
					"<td align='left'>" + name + "</td>" +
					"<td align='center'>" + qty + "</td>" +
					"<td align='center'><input type='number' style='width: 60px;' min=0 max=" + qty + " value=" + qty + "></td>" +
					"<td align='center'>" + sum_qty + "</td>" +
					"<td align='right'>" + harga + "</td>" +
					"<td align='right'>" + diskon + "</td>" +
					"<td align='right'>" + total + "</td>" +
					"<td align='center'><input type='button' class='btn btn-sm btn-danger' value='Hapus'></td>" +
					"</tr>";

				data.check = qty;
				data.total = total;

				tbody.append(str);

				//Add an event click button on collumn
				tbody.find('input[type="button"]').off('click');
				tbody.find('input[type="button"]').on('click', function (event) {
					$(event.target).closest('tr').remove();

					me.calculate(me.elements);
					$.each(tbody.find("tr"), function (i, tr) {
						var row = $(tr).children().get(0);
						$(row).html(i + 1);
					});
				});

				//Add an event change input number on collumn
				tbody.find('input[type="number"]').off('input');
				tbody.find('input[type="number"]').on('input', function (event) {
					var input = $(event.target);
					var parent = input.closest('tr');
					var maxVal = parent.data("qty");

					if ((parseFloat(input.val()) < 0) || isNaN(parseFloat(input.val()))) {
						input.val(0);
						input.data({
							value: 0,
							valid: true
						})
					} else if (parseFloat(input.val()) > maxVal) {
						input.val(maxVal);
						input.data({
							value: maxVal,
							valid: true
						})
					} else {
						input.val(parseFloat(input.val()));
						input.data({
							value: parseFloat(input.val()),
							valid: true
						})
					}

					var qty = parseFloat(input.data("value"));
					var harga = parseFloat(data["harga_beli"]);
					var diskon = parseFloat(data["discount"]);
					var total = (harga * qty) - (harga * qty * diskon / 100);

					parent.data("check", input.data("value"));
					parent.data("total", total);

					me.calculate(me.elements);
				});

				var x = 1, z = setInterval(function () {
					if (tbody.find("#" + uuid).length == 1) {
						clearInterval(z);

						tbody.find("#" + uuid).data(data);
						me.calculate(me.elements);
					}
					x++;
				}, 200);
			}
		}
	});
};

IPenerimaan.prototype.calculate = function (elements) {
	var me = this;
	var products = [];
	var data = [];
	var tax = elements.inputTax.object.data("value");
	var total = 0;
	var check = 0;

	$.each(elements.tableOrderPembelian.object.find('tbody>tr'), function (i, tr) {
		var id = $(tr).attr('id');
		var data = $(tr).data();

		total += data.total;
		check += data.check;
		products.push(data["fk.id_product"]);

		elements.inputTotalQty.object.html(check);
		elements.inputTotalItems.object.html(products.getUnique().length);
		elements.inputTotal.object.val(total);
		elements.inputGrandTotal.object.val(total + (total * tax / 100));
	});
};

IPenerimaan.prototype.validate = function (elements) {
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
		if (valid.tableOrderPembelian.data("fk.id_product")) arr[5] = true;
	}

	return [arr, valid];
};

$(document).ready(function () {
	var iPenerimaan = new IPenerimaan();
	iPenerimaan.initialize();
});
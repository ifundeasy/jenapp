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
		tableOrderPembelian     : {
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
			events: []
		},
		btnSubmitTrans      : {
			object: "#btnSubmitTrans",
			config: [],
			events: []
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
			events: []
		},
		inputGrandTotal     : {
			object: "#inputGrandTotal",
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
		}
	};

	me.focusAt = "";

	me.ajax(me.prepare());
};

IOrderBeli.prototype.ajax = function (callback) {
	var cb, me = this;
	Ajax('get', './server/custom/harga', {}, function (jqXHR, textStatus, rawData) {
		if (rawData) me.data.product = rawData;

		rawData.forEach(function(raw){ raw.value = raw.name });

		Ajax('get', './server/custom/supplier', {}, function (jqXHR, textStatus, rawData) {
			if (rawData) me.data.supplier = rawData;

			rawData.forEach(function(raw){ raw.value = raw.id_supplier });

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
				key.config.forEach(function (name) {
					if (me[name]) {
						if (typeof me[name] == 'function') me[name](key.object, me.elements);
					} else {
						console.warn("IOrderBeli.prototype." + name + " is " + me[name]);
					}
				});
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
		var price = product.harga_beli;

		console.log(product, qty, discount, price);
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
	});
};

IOrderBeli.prototype.changeInputTransNumb = function (object, elements) {
	var me = this;
	object.off('input');
	object.on('input', function () {
		Ajax('get', './server/api/purchase/' + object.val(), {}, function(jq, res, data) {
			if (data.length == 0) {
				object.parent().removeClass("has-error");
				object.parent().addClass("has-success");
			} else {
				object.parent().removeClass("has-success");
				object.parent().addClass("has-error");
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
	object.find("tbody").html("")
};

IOrderBeli.prototype.confInputDateTrans = function (object, elements) {
	var me = this;
	object.datepicker({
		weekStart         : 1,
		language          : "id",
		format            : "yyyy-mm-dd",
		daysOfWeekDisabled: "0",
		startDate         : me.date
	});
	object.datepicker('update', me.date);
};

IOrderBeli.prototype.confInputSupplier = function (object, elements) {
	var me = this;
	var z = setInterval(function(){
		if (me.data.supplier) {
			clearInterval(z);
			object.autocomplete({
				lookup: me.data.supplier,
				onSelect: function (suggestion) {
					function display () {
						var ret = "";
						if (suggestion.first_name) ret += suggestion.first_name + " ";
						if (suggestion.last_name) ret += suggestion.last_name;

						return ret;
					}
					object.data({
						value : suggestion.id_supplier,
						display : display(),
						address : suggestion.address,
						city : suggestion.city,
					});
					elements.inputSupplierAddr.object.val(suggestion.address + " " + suggestion.city);
				}
			});
		}
	}, 200)
};

IOrderBeli.prototype.confInputProduct = function (object, elements) {
	var me = this;
	var z = setInterval(function(){
		if (me.data.product) {
			clearInterval(z);
			object.autocomplete({
				lookup: me.data.product,
				onSelect: function (suggestion) {
					object.data({
						value : suggestion.id_product,
						display : suggestion.name,
						harga_beli: parseFloat(suggestion.harga_beli),
						harga_jual: parseFloat(suggestion.harga_jual)
					});
					if (parseFloat(suggestion.harga_beli)) {
						elements.inputProductPrice.object.val(parseFloat(suggestion.harga_beli));

						elements.inputProductQty.object.val(1);
						elements.inputProductQty.object.data("value", 1);

						elements.inputProductDiscount.object.val(0);
						elements.inputProductDiscount.object.data("value", 0);
					} else {
						alert("Tidak dapat memilih barang ini, karena tidak memiliki harga jual")
					}
				}
			});
		}
	}, 200)
};

$(document).ready(function () {
	var iOrderBeli = new IOrderBeli();
	iOrderBeli.initialize();
});
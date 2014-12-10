/**
 * Created by rappresent on 12/11/14.
 */
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
			object: "#containerNew"
		},
		containerSearch     : {
			object: "#containerSearch"
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

$(document).ready(function () {
	var iOrderBeli = new IOrderBeli();
	iOrderBeli.initialize();
});
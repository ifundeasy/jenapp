/**
 * Created by rappresent on 12/14/14.
 */
function IStockBarang() {
}

IStockBarang.prototype.initialize = function () {
	var me = this;
	me.data = {};
	me.Date = new Date();
	me.date = this.Date.getFullYear() + "-" + this.Date.getMonth() + "-" + this.Date.getDate();
	me.module = $('div[page="i-stockbarang"]');
	me.elements = {
		containerSearch: {
			object: "#containerSearch"
		},
		containerTable     : {
			object: "#containerTable"
		},
		inputDate : {
			object: "#inputDate",
			config: ["confInputDate"]
		},
		btnSearch      : {
			object: "#btnSearch",
			events: ["clickBtnSearch"]
		}
	};

	me.prepare()
};

IStockBarang.prototype.prepare = function () {
	var me = this;

	Object.keys(me.elements).forEach(function (key) {
		me.initEl(key, me.elements[key].object);
	});
};

IStockBarang.prototype.initEl = function (key, object) {
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
							console.warn("IStockBarang.prototype." + name + " is " + me[name]);
						}
					});

				if (key.events)
					key.events.forEach(function (name) {

						if (me[name]) {
							if (typeof me[name] == 'function') me[name](key.object, me.elements);
						} else {
							console.warn("IStockBarang.prototype." + name + " is " + me[name]);
						}
					});

				return me.elements;
			}
		}
	}
};

IStockBarang.prototype.confInputDate = function (object, elements) {
	var me = this;
	object.datepicker({
		weekStart         : 1,
		language          : "id",
		format            : "yyyy-mm-dd",
		daysOfWeekDisabled: "0",
		endDate           : me.date,
		multidate         : false,
		autoclose         : true,
	});
	object.datepicker('update', me.date);
};

IStockBarang.prototype.clickBtnSearch = function (object, elements) {
	var me = this;
	object.off('click');
	object.on('click', function () {
		var date = elements.inputDate.object.val();
		var container = elements.containerTable.object;

		Ajax('get', './server/custom/stock?start='+ date, {}, function (jqXHR, success, data) {
			var uuid = (new Date()).getTime();
			var rowData = [];

			container.html('');
			container.append('<table id=' + uuid + ' class="table table-striped table-bordered table-hover dt-responsive"></table>');

			if ((typeof data == "object") && (data.length > 0)) rowData = data;

			container.find('table#' + uuid).dataTable({
				"data"   : rowData,
				"columns": [
					{
						"title": "Tanggal",
						"data": "ipb_date"
					},
					{
						"title": "Kode",
						"data": "code"
					},
					{
						"title": "Nama",
						"data": "name"
					},
					{
						"title": "Harga",
						"data": "value"
					},
					{
						"title": "Qty",
						"data": "qty_p",
						"class": "right"
					},
					{
						"title": "Retur",
						"data": "qty_r",
						"class": "right"
					},
					{
						"title": "Sum",
						"data": "qty",
						"class": "right"
					}
				]
			});

			container.find('label select').css('margin-right', 5);
			container.find('label input').css('margin-left', 5);
		});
	});
};

$(document).ready(function () {
	var iStockBarang = new IStockBarang();
	iStockBarang.initialize();
});
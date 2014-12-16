/**
 * Created by rappresent on 12/16/14.
 */

String.prototype.numberWithCommas = function () {
	if (typeof parseFloat(this) === "number") {
		thiss = (Math.round((this) * 100) / 100).toString();
		var dotLastIndex = this.lastIndexOf(".");
		if (dotLastIndex === -1) {
			thiss = this + ".00"
		} else {
			var decimal = this.substring(dotLastIndex+1);
			var nonDecimal = this.substring(0, dotLastIndex);
			thiss = nonDecimal + "." + decimal;

			if (this[this.lastIndexOf(".")+2] == undefined) {
				thiss = this + "0"
			}
		}

		var parts = this.toString().split(",");
		parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return parts.join(".");
	} else {
		console.log(this, ": please only number")
	}
};

Array.prototype.getUnique = function(){
	var u = {}, a = [];
	for(var i = 0, l = this.length; i < l; ++i){
		if(u.hasOwnProperty(this[i])) {
			continue;
		}
		a.push(this[i]);
		u[this[i]] = 1;
	}
	return a;
};
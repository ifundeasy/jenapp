/**
 * Created by rappresent on 11/5/14.
 */

var Profile, Cache, Ajax, Personalize;
$(function () {
	Profile = {};
	Cache = function () {
		var date = new Date().getTime();
		var other = Math.floor(performance.now());

		return (date + '-' + other);
	};
	Ajax = function(mode, url, data, callback) {
		$.ajax({
			type     : mode,
			url      : url,
			data     : data,
			xhrFields: {
				withCredentials: true
			},
			complete : function (jqXHR, textStatus) {
				var data;
				try {
					data = JSON.parse(jqXHR.responseText).data;
				} catch (e) {}

				if (callback) {
					var cb;
					typeof callback == "function" ? cb = callback(jqXHR, textStatus, data) : cb = callback;
					return cb;
				}
			}
		})
	};
	Personalize = function (callback) {
		var brand = $("nav a#brand");
		var wrapper = $("#wrapper");
		var sidebarWrapper = $("#sidebar-wrapper");
		var navbar = $('nav');
		var navbarHeight = $('nav').height();
		var themes = $('nav ul[theme]>li[name]');
		var themeSource = $('link[theme]');
		var activeThemes = $('nav ul[theme]>li[active]>a');
		var sidebarBugs = function () {
			var z = null;
			z = setInterval(function () {
				if (navbarHeight === navbar.height()) {
					clearInterval(z);
					z = null;
				} else {
					sidebarWrapper.css('top', navbar.height());
				}
			}, 500);
		};
		var logout = $('input#logout');
		var logoutTrigger = $('a#logout');

		logoutTrigger.click(function () {
			logout.trigger('click');
		});

		brand.click(function (e) {
			e.preventDefault();
			wrapper.toggleClass("toggled");
		});

		themes.on('click', function (obj) {
			var theme = $(obj.target).parent().attr('name');
			activeThemes.html(theme.toTitleCase());
			themeSource.attr('theme', theme);
			themeSource.attr('href', "./bower/bootswatch/" + theme + "/bootstrap.min.css");

			window.localStorage.ceramicAppTheme = theme;
			new sidebarBugs();
		});

		if (window.localStorage.ceramicAppTheme) {
			themeSource.attr('href', "./bower/bootswatch/" + window.localStorage.ceramicAppTheme + "/bootstrap.min.css");
			activeThemes.html(window.localStorage.ceramicAppTheme.toTitleCase());
			new sidebarBugs();
		} else {
			window.localStorage.ceramicAppTheme = themeSource.attr('theme');
		}

		var profiles = [
			{name : 'internal', class : 'primary'},
			{name : 'member', class : 'info'},
			{name : 'supplier', class : 'success'}
		];

		Ajax('get', './server/api/company', {
			s: "1",
			cache: Cache(),
		}, function(jqXHR, textStatus) {
			Profile['company'] = JSON.parse(jqXHR.responseText).data[0];
			if (Profile['company']) {
				$('a#brand').html(Profile['company'].name);
				$('title').html(Profile['company'].name);
			}
		});

		profiles.forEach(function(kind, a){
			var name = kind.name;
			Ajax('get', './server/api/'+ name, {
				fs  : "*",
				f0_n: "fk.id_contact",
				f0_l: "=",
				f0_v: $('span#contact').attr('contact'),
				cache: Cache(),
			}, function(jqXHR, textStatus) {
				Profile[name] = JSON.parse(jqXHR.responseText).data[0];
				if (Profile[name]) {
					var txt = "id_"+ name +"_group";
					Ajax('get', './server/api/'+ name +'_group', {
						fs  : "*",
						f0_n: txt,
						f0_l: "=",
						f0_v: Profile[name]['fk.'+txt],
						cache: Cache(),
					}, function(jqXHR, textStatus) {
						Profile[name+"_group"] = JSON.parse(jqXHR.responseText).data[0];
						if (Profile[name+"_group"]) {
							var txt = "id_"+ name +"_group";
							Ajax('get', './server/api/'+ name +'_module', {
								fs  : "*",
								f0_n: 'fk.'+ txt,
								f0_l: "=",
								f0_v: Profile[name+"_group"][txt],
								cache: Cache(),
							}, function(jqXHR, textStatus) {
								Profile[name+"_module"] = JSON.parse(jqXHR.responseText).data;

								if (Profile[name+"_module"]) {
									Profile[name+"_module"].forEach(function(module, b){
										var key = module["fk.id_"+ name +"_module"];

										if (key == null) {
											$('div#sidebar-wrapper>ul').append(
												'<li class="divider" module='+ module["id_"+ name +"_module"] +'>'+ module.name.toTitleCase() +
													'<span style="position: relative;left: 5px; top: -5px;" class="label label-'+ kind.class +'">'+ name.toTitleCase() +'</span></li>'
											);
											var children = Profile[name+"_module"].filter(function(item){
												return item["fk.id_"+ name +"_module"] == module["id_"+ name +"_module"];
											});
											children.forEach(function(item){
												$('div#sidebar-wrapper>ul').append(
													'<li togo="'+ item.handler +'" module='+ item["id_"+ name +"_module"] +'><a id="'+ item.handler +'">'+
														item.name.toTitleCase() + '</a></li>'
												);
											});
										}
									})
								}
							});
						}
					});
				}
			});
		});

		if (callback) {
			var cb;
			typeof callback == "function" ? cb = callback(Profile) : cb = callback;
			return cb;
		}
	};

	$(document).ready(function () {
		$.fn.scrollTo = function( target, options, callback ){
			if(typeof options == 'function' && arguments.length == 2){ callback = options; options = target; }
			var settings = $.extend({
				scrollTarget  : target,
				offsetTop     : 50,
				duration      : 500,
				easing        : 'swing'
			}, options);
			return this.each(function(){
				var scrollPane = $(this);
				var scrollTarget = (typeof settings.scrollTarget == "number") ? settings.scrollTarget : $(settings.scrollTarget);
				var scrollY = (typeof scrollTarget == "number") ? scrollTarget : scrollTarget.offset().top + scrollPane.scrollTop() - parseInt(settings.offsetTop);
				scrollPane.animate({scrollTop : scrollY }, parseInt(settings.duration), settings.easing, function(){
					if (typeof callback == 'function') { callback.call(this); }
				});
			});
		};

		new Personalize(function(param){
			var z = undefined, i = 0;
			z = setInterval(function(){
				if ((i > 4) && (param == Profile)) {
					clearInterval(z); z = undefined; i = 0;

					var profile = {};
					var modules = {};
					$.each(Profile, function(key, value) {
						if (key.indexOf('module') !== -1){
							profile[key] = Profile[key];
							modules[key] = [];
							profile[key].forEach(function(a){
								if (a.handler) {
									modules[key].push(a)
								}
							});
						}
					});

					var Router = {
						routes   : {
							""       : "home",
							"home"   : "home"
						},
						deselect : function () {
							$('.sidebar-nav > li[togo]').removeClass('selected');
						},
						selecting: function (selector) {
							this.deselect();
							$(selector).parent().addClass('selected');
							$("nav a#brand").trigger('click');
						},
						hidePages: function () {
							$('div[page]').hide();
						},
						showPage : function (clue, selector, url) {
							this.hidePages();
							if ($(selector).length) {
								$(selector).show();
							} else {
								$.ajax({
									url        : url,
									contentType: "html",
									context    : document.body,
									xhrFields  : {
										withCredentials: true
									},
									complete   : function (jqXHR, textStatus) {
										var tag = '<div page='+ clue +'>'+ jqXHR.responseText +'</div>';
										$('div#content').append(tag);
									}
								})
							}
						},
						home   : function () {
							this.selecting('a#home-page');
							this.showPage('home-page', 'div[page="home-page"]', "./app/view/home.html");
						}
					};
					var View = {
						el            : $('body'),
						events        : {
							'click li[togo="home-page"]'   : 'displayHome'
						},
						initialize    : function () {
							var me = this;
							me.router = new ApplicationRouter();
							Backbone.history.start();
							/*
							Backbone.history.start({
								pushState: true,
								root: "/"
							});
							*/
						},
						displayHome   : function () {
							this.router.navigate("home", true);
						}
					}


					$.each(modules, function(key, value) {
						modules[key].forEach(function(obj){
							var display = "display-" + obj.handler;

							Router.routes[obj.handler] = obj.handler;
							Router[obj.handler] = function () {
								Router.selecting('a#' + obj.handler);
								Router.showPage(obj.handler, 'div[page="'+ obj.handler +'"]', './app/view/'+ obj.handler +'.html');
								$("#content").get(0).scrollIntoView(0);
							};

							View.events['click li[togo="'+ obj.handler +'"]'] = display;
							View[display] = function () {
								this.router.navigate(obj.handler, true);
							};
						})
					});

					var ApplicationRouter = Backbone.Router.extend(Router);
					var ApplicationView = Backbone.View.extend(View);

					new ApplicationView();
				}
				i++
			}, 250);
		})
	});
});

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
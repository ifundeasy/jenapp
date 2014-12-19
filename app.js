/**
 * Created by rappresent on 11/5/14.
 */

var Profile, Cache, Ajax, AjaxSync;

function App () {};

App.prototype.init = function () {
	var me = this;

	me.profile = {};
	me.interval = 500;
	me.title = $("title");
	me.brand = $("nav a#brand");
	me.wrapper = $("#wrapper");
	me.sidebarWrapper = $("div#sidebar-wrapper");
	me.sidebarWrapperList = $('div#sidebar-wrapper>ul');
	me.navbar = $('nav');
	me.navbarHeight = $('nav').height();
	me.themes = $('nav ul[theme]>li[name]');
	me.themeSource = $('link[theme]');
	me.activeThemes = $('nav ul[theme]>li[active]>a');
	me.logout = $('input#logout');
	me.logoutTrigger = $('a#logout');
	me.profileKind = [
		{name : 'internal', class : 'primary'},
		{name : 'member', class : 'info'},
		{name : 'supplier', class : 'success'}
	];

	me.loadProfile();
	me.personalize();
	me.globalVar();
};
App.prototype.cache = function () {
	var date = new Date().getTime();
	var other = Math.floor(performance.now());

	return (date + '-' + other);
};
App.prototype.ajax = function (mode, url, data, callback) {
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
			} catch (e) {
			}
			if (callback) {
				var cb;
				typeof callback == "function" ? cb = callback(jqXHR, textStatus, data) : cb = callback;
				return cb;
			}
		}
	})
};
App.prototype.ajaxSync = function (mode, url, data, callback) {
	$.ajax({
		type     : mode,
		url      : url,
		data     : data,
		async    : data,
		xhrFields: {
			withCredentials: true
		},
		complete : function (jqXHR, textStatus) {
			var data;
			try {
				data = JSON.parse(jqXHR.responseText).data;
			} catch (e) {
			}
			if (callback) {
				var cb;
				typeof callback == "function" ? cb = callback(jqXHR, textStatus, data) : cb = callback;
				return cb;
			}
		}
	})
};
App.prototype.sidebarBugs = function () {
	var me = this;
	var z = null;

	z = setInterval(function () {
		if (me.navbarHeight === me.navbar.height()) {
			clearInterval(z);
			z = null;
		} else {
			me.sidebarWrapper.css('top', me.navbar.height());
		}
	}, me.interval);
};
App.prototype.personalize = function (callback) {
	var me = this;
	me.logoutTrigger.click(function () {
		me.logout.trigger('click');
	});

	me.brand.click(function (e) {
		e.preventDefault();
		me.wrapper.toggleClass("toggled");
	});

	me.themes.on('click', function (obj) {
		var theme = $(obj.target).parent().attr('name');
		me.activeThemes.html(theme.toTitleCase());
		me.themeSource.attr('theme', theme);
		me.themeSource.attr('href', "./bower/bootswatch/" + theme + "/bootstrap.min.css");

		window.localStorage.ceramicAppTheme = theme;
		me.sidebarBugs();
	});

	if (window.localStorage.ceramicAppTheme) {
		me.themeSource.attr('href', "./bower/bootswatch/" + window.localStorage.ceramicAppTheme + "/bootstrap.min.css");
		me.activeThemes.html(window.localStorage.ceramicAppTheme.toTitleCase());
		me.sidebarBugs();
	} else {
		window.localStorage.ceramicAppTheme = me.themeSource.attr('theme');
	}

	if (callback) {
		var cb;
		typeof callback == "function" ? cb = callback(me.profile) : cb = callback;
		return cb;
	}
};
App.prototype.loadProfile = function () {
	var me = this;

	me.ajax('get', './server/api/company', {
		s: "1",
		cache: me.cache(),
	}, function(jqXHR, textStatus, data) {
		if (data[0]) {
			me.profile['company'] = data[0];

			me.brand.html(data[0].name);
			me.title.html(data[0].name);

			me.profileKind.forEach(function(kind, a){
				var name = kind.name;

				me.ajax('get', './server/api/'+ name, {
					fs  : "*",
					f0_n: "fk.id_contact",
					f0_l: "=",
					f0_v: $('span#contact').attr('contact'),
					cache: me.cache(),
				}, function(jqXHR, textStatus, data) {
					if (data[0]) {
						var txt = "id_"+ name +"_group";

						me.profile[name] = data[0];
						me.ajax('get', './server/api/'+ name +'_group', {
							fs  : "*",
							f0_n: txt,
							f0_l: "=",
							f0_v: me.profile[name]['fk.'+txt],
							cache: me.cache(),
						}, function(jqXHR, textStatus, data) {
							if (data[0]) {
								var txt = "id_"+ name +"_group";

								me.profile[name+"_group"] = data[0];
								me.ajax('get', './server/api/'+ name +'_module', {
									fs  : "*",
									f0_n: 'fk.'+ txt,
									f0_l: "=",
									f0_v: me.profile[name+"_group"][txt],
									cache: me.cache(),
								}, function(jqXHR, textStatus, data) {
									if (data) {
										me.profile[name+"_module"] = data;
										me.profile[name+"_module"].forEach(function(module, b){
											var key = module["fk.id_"+ name +"_module"];

											if (key == null) {
												me.sidebarWrapperList.append(
													'<li class="divider" module='+ module["id_"+ name +"_module"] +'>'+ module.name.toTitleCase() +
														'<span style="position: relative;left: 5px; top: -5px;" class="label label-'+ kind.class +'">'+ name.toTitleCase() +'</span></li>'
												);
												var children = me.profile[name+"_module"].filter(function(item){
													return item["fk.id_"+ name +"_module"] == module["id_"+ name +"_module"];
												});
												children.forEach(function(item, c){
													me.sidebarWrapperList.append(
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
		}
	});
};
App.prototype.globalVar = function () {
	var me = this;
	var temp, z, i = 0;

	me.modules = {};
	z = setInterval(function(){
		if (temp == me.profile) {
			clearInterval(z);
			z = undefined;
			i = 0;

			Profile = me.profile;
			Ajax = me.ajax;
			AjaxSync = me.ajaxSync;
			Cache = me.cache;

			$.each(me.profile, function(key, value) {
				if (key.indexOf('module') !== -1){
					me.modules[key] = [];
					me.profile[key].forEach(function(a){
						if (a.handler) {
							me.modules[key].push(a);
						}
					});
				}

				if (Object.keys(me.profile).indexOf(key) == Object.keys(me.profile).length-1) {
					me.backedboned()
				}
			});
		} else {
			temp = me.profile;
		}

		i++
	}, me.interval);
};
App.prototype.backedboned = function () {
	var me = this;
	var AppRouter;
	var AppView;
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
			me.router = new AppRouter();
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
	};

	$.each(me.modules, function(key, value) {
		me.modules[key].forEach(function(obj, i){
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

			if ((i == me.modules[key].length-1) && (Object.keys(me.modules).indexOf(key) == Object.keys(me.modules).length-1)) {
				AppRouter = Backbone.Router.extend(Router);
				AppView = Backbone.View.extend(View);

				return new AppView();
			}
		})
	});
};

$(document).ready(function () {
	(new App()).init();

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
});
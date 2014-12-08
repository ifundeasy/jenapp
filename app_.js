/**
 * Created by rappresent on 11/5/14.
 */

var Profile = {};
var Cache = function () {
	var date = new Date().getTime();
	var other = Math.floor(performance.now());
	return (date + '-' + other);
};
$(function () {
	var ApplicationRouter = Backbone.Router.extend({

		/* Module Router*/
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
		showPage : function (selector, url) {
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
						$('div#content').append(jqXHR.responseText);
					}
				})
			}
		},

		/* Module Router*/
		home   : function () {
			this.selecting('a#home-page');
			this.showPage('div[page="home-page"]', "./app/view/home.html");
		}
	});

	var ApplicationView = Backbone.View.extend({
		el            : $('body'),
		events        : {

			/* Module View Events*/
			'click li[togo="home-page"]'   : 'displayHome'
		},
		initialize    : function () {
			var me = this;
			$(document).ready(function () {
				new personalized();
				me.router = new ApplicationRouter();
				Backbone.history.start();
			});
		},

		/* Module View*/
		displayHome   : function () {
			this.router.navigate("home", true);
		}
	});

	var personalized = function () {
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
		$.ajax({
			/*
			url      : './server/api/company?' + decodeURIComponent($.param({
				s: "1",
				cache: Cache(),
			})),
			dataType : "application/json",
			*/
			type     : "GET",
			url      : './server/api/company',
			data     : {
				s: "1",
				cache: Cache(),
			},
			xhrFields: {
				withCredentials: true
			},
			complete : function (jqXHR, textStatus) {
				Profile['company'] = JSON.parse(jqXHR.responseText).data[0];
				if (Profile['company']) {
					$('a#brand').html(Profile['company'].name);
					$('title').html(Profile['company'].name);
				}
			}
		});
		profiles.forEach(function(kind){
			$.ajax({
				type     : "GET",
				url      : './server/api/'+ kind.name,
				data     : {
					fs  : "*",
					f0_n: "fk.id_contact",
					f0_l: "=",
					f0_v: $('span#contact').attr('contact'),
					f1_n: "active",
					f1_l: "=",
					f1_v: "1",
					lgc0: "and",
					cache: Cache(),
				},
				xhrFields: {
					withCredentials: true
				},
				complete : function (jqXHR, textStatus) {
					Profile[kind.name] = JSON.parse(jqXHR.responseText).data[0];
					if (Profile[kind.name]) {
						var txt = "id_"+ kind.name +"_group";
						$.ajax({
							type     : "GET",
							url      : './server/api/'+ kind.name +'_group',
							data     : {
								fs  : "*",
								f0_n: txt,
								f0_l: "=",
								f0_v: Profile[kind.name]['fk.'+txt],
								f1_n: "active",
								f1_l: "=",
								f1_v: "1",
								lgc0: "and",
								cache: Cache(),
							},
							xhrFields: {
								withCredentials: true
							},
							complete : function (jqXHR, textStatus) {
								Profile[kind.name+"_group"] = JSON.parse(jqXHR.responseText).data[0];
								if (Profile[kind.name+"_group"]) {
									var txt = "id_"+ kind.name +"_group";
									$.ajax({
										type     : "GET",
										url      : './server/api/'+ kind.name +'_module',
										data     : {
											fs  : "*",
											f0_n: 'fk.'+ txt,
											f0_l: "=",
											f0_v: Profile[kind.name+"_group"][txt],
											f1_n: "active",
											f1_l: "=",
											f1_v: "1",
											lgc0: "and",
											cache: Cache(),
										},
										xhrFields: {
											withCredentials: true
										},
										complete : function (jqXHR, textStatus) {
											Profile[kind.name+"_module"] = JSON.parse(jqXHR.responseText).data;
											if (Profile[kind.name+"_module"]) {
												Profile[kind.name+"_module"].forEach(function(module){
													var key = module["fk.id_"+ kind.name +"_module"];
													if (key == null) {
														$('div#sidebar-wrapper>ul').append(
															'<li class="divider" module='+ module["id_"+ kind.name +"_module"] +'>'+ module.name.toTitleCase() +
																'<span style="position: relative;left: 5px; top: -5px;" class="label label-'+ kind.class +'">'+ kind.name.toTitleCase() +'</span></li>'
														);
														var children = Profile[kind.name+"_module"].filter(function(item){
															return item["fk.id_"+ kind.name +"_module"] == module["id_"+ kind.name +"_module"];
														});
														children.forEach(function(item){
															$('div#sidebar-wrapper>ul').append(
																'<li togo="'+ item.handler +'" module='+ item["id_"+ kind.name +"_module"] +'><a id="'+ item.handler +'">'+
																	item.name.toTitleCase() + '</a></li>'
															);
														});
													}
												})
											}
										}
									});
								}
							}
						});
					}
				}
			});
		});
	};

	new ApplicationView();
});
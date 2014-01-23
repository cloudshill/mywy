// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require payfor
//= require countdown
//= require jquery.cycle
//= require jquery.autogrowtextarea.min
//= require_self


window.App = {
	addToCart: function(el) {
		var product_count, product_id;
	   	product_id = $(el).data("id");
	   	$.ajax({
	     	url: "/line_items",
	      	type: "POST",
	      	data: {
	        	id: product_id,
	        	amount: 1
	      	},
	      	success: function(result, status, xhr) {
	        	$("#notification").append("<div class='alert alert-success'>添加成功！</div>");
	      	},
	      	error: function(result, status, xhr) {
	        	$("#notification").append("<div class='alert alert-error'>添加失败！</div>");
	      	}
	    });
	},

	addToFavorite: function(el) {
		var product_id = $(el).data("id");
		if ($(el).data("state") != "favorited") {
			$.ajax({
			  url: "/favorites",
			  type: "POST",
			  data: {
			    id: product_id
			  }
			});
			$(el).data("state", "favorited").attr("css", "fa fa-heart product-icon-active")
		} else{
			$.ajax({
			  url: "/favorites/" + product_id,
			  type: "DELETE"
			});
			$(el).data("state", "").attr("css", "fa fa-heart product-icon")
		};
	},

	addToCompare: function(param) {

	}
};

$(document).ready(function(){
    $("textarea").autoGrow();
});
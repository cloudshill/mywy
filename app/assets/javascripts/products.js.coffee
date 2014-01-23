# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require elevatezoom-min
#= require tabs

window.Product =
	addToCart: (el) ->
		product_id = $(el).data("id")
		product_count = $("#quantity").val()
		$.ajax
			url: "/line_items",
			type: "POST",
			data: 
				id: product_id
				amount: product_count
			success: (result, status, xhr) ->
				$("#notification").append("<div class='alert alert-success'>添加成功！</div>")
			error: (result, status, xhr) ->
				$("#notification").append("<div class='alert alert-error'>添加失败！</div>");
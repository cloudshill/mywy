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
//= require products
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
	},
	moviePubDateChange: function(span) {  
    $('span[name="'+$(span).attr('name')+'"]').each(function(){
      if(this!=span) {
        this.className="unchecked";  
        this.checked=false;
      }                 
    });  
    span.className="checked";  
    span.checked=true;
    $("#selectedDate").val($(span).attr("id"));
    $.ajax({
      url: "/show_times.json",
      type: "GET",
      dataType: "json",
      data: {
        day: $("#selectedDate").val(),
        cinema: $("#selectedCinema").val()
      },
      success: function(result, status, xhr){
        var html = "";
        $.each(result, function(key, value) {
          html += "<li><span class='unchecked' data-id='" + value["id"] + 
          "' name='timeSpan' checked='false' onclick='App.movieShowTimeChange(this);' >" 
          + value["show_time"] + "</span></li>";
        });
        $("#show_times").html(html);
      },
      error: function(result, status, xhr){

      }
    });
  },
  cinemaChange: function(span) {  
    $('span[name="'+$(span).attr('name')+'"]').each(function(){
      if(this!=span) {
        this.className="unchecked";  
        this.checked=false;  
      }                 
    });  
    span.className="checked";  
    span.checked=true;
    $("#selectedCinema").val($(span).attr("data-id"));
    $("#ticket_cinema_id").val($(span).attr("data-id"));
    $.ajax({
      url: "/show_times.json",
      type: "GET",
      dataType: "json",
      data: {
        day: $("#selectedDate").val(),
        cinema: $("#selectedCinema").val()
      },
      success: function(result, status, xhr){
        var html = "";
        $.each(result, function(key, value) {
          html += "<li><span class='unchecked' data-id='" + value["id"] + 
          "' name='timeSpan' checked='false' onclick='App.movieShowTimeChange(this);' >" 
          + value["show_time"] + " - " + value["price"] + "元</span></li>";
        });
        $("#show_times").html(html);
      },
      error: function(result, status, xhr){

      }
    });
  },
  movieShowTimeChange: function(span) {  
    $('span[name="'+$(span).attr('name')+'"]').each(function(){
      if(this!=span) {
        this.className="unchecked";  
        this.checked=false;  
      }                 
    });  
    span.className="checked";  
    span.checked=true;
    $("#ticket_show_time_id").val($(span).attr("data-id"));
  },
  movieSelectSeat: function(span) {
    if(span.className == "checked") {
      span.className = "unchecked";
      span.checked=false;
      $("#selectedSeat_" + $(span).attr("data-id")).remove();
    } else {
      span.className = "checked";
      span.checked=true;
      $("#selectedSeats").append("<li id='selectedSeat_" + $(span).attr("data-id") + 
        "'><input type='checkbox' style='display:none;' name='seats[]' checked='true' value='" + $(span).attr("data-id") + 
        "' /><span class='checked' checked='true' >" + $(span).text() + "</span></li>");
    }
  }
};

$(document).ready(function(){
  $("textarea").autoGrow();
  $('#myModal').on('show.bs.modal', function (e) {
    var show_time_id = 0;
    $('span[name="timeSpan"]').each(function(){
      if(this.className=="checked" && this.checked==true) {
        show_time_id = $(this).attr("data-id");
        return;
      }                 
    });
    if(show_time_id == 0) {
      return;
    }
    $.ajax({
      url: "/hall_seats.json",
      type: "GET",
      dataType: "json",
      data: {
        show_time_id: show_time_id
      },
      success: function(result, status, xhr){
        var html = "<ul class='list-inline'>";
        var pre_row = 1;
        var new_row = "";
        $.each(result, function(key, value) {
          if(pre_row != value["row"]) {
            new_row = "</ul><ul class='list-inline'>";
          }
          pre_row = value["row"];
          if(value["booking"]) {
            html += new_row + '<li><span data-id="' + value["id"] + '" class="unchecked" name="seatSpan" checked="false" onclick="App.movieSelectSeat(this);">' + value["row"] + '排' + value["col"] + '号</span></li>';
          } else {
            html += new_row + '<li><span class="checked">' + value["row"] + '排' + value["col"] + '号</span></li>';
          }
          new_row = "";
        });
        html += "</ul>";
        $("#hall_seats").html(html);
      },
      error: function(result, status, xhr){

      }
    });
  });
});
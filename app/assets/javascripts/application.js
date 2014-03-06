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
//= require jquery.autogrowtextarea.min
//= require bootstrap-editable.min
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
	    	$("#notification").append("<div class='alert alert-success'>添加成功！<a href='#' class='close' 'data-dismiss'='alert'>x</a></div>");
	   	},
      error: function(result, status, xhr) {
        $("#notification").append("<div class='alert alert-danger'>请先登录,添加失败！<a href='#' class='close' 'data-dismiss'='alert'>x</a></div>");
      }
    });
	},

	addToFavorite: function(el) {
		var object_id = $(el).data("id");
    var object_type = $(el).data("type");
		if ($(el).data("state") != "favorited") {
			$.ajax({
			  url: '/' + object_type + '/' + object_id + '/favorites',
			  type: "POST"
			});
			$(el).data("state", "favorited").attr("class", "btn btn-danger")
		} else{
			$.ajax({
			  url: '/' + object_type + '/' + object_id + '/favorites/' + $(el).data("o"),
			  type: "DELETE"
			});
			$(el).data("state", "").attr("class", "btn btn-default")
		};
	},

	addToCompare: function(param) {
	},
  movieChange: function(span) {
    $('span[name="'+$(span).attr('name')+'"]').each(function(){
      if(this!=span) {
        this.className="unchecked";  
        this.checked=false;
      }                 
    });  
    span.className="checked";  
    span.checked=true;
    $("#selectedMovie").val($(span).attr("data-id"));
    $("#ticket_movie_id").val($(span).attr("data-id"));
    $.ajax({
      url: "/show_times.json",
      type: "GET",
      dataType: "json",
      data: {
        day: $("#selectedDate").val(),
        movie: $("#selectedMovie").val()
      },
      success: function(result, status, xhr){
        var html = "";
        $.each(result, function(key, value) {
          html += "<li><span class='unchecked' data-id='" + value["id"] + 
          "' name='timeSpan' checked='false' onclick='App.cinemaShowTimeChange(this);' >" 
          + value["show_time"] + " - " + value["price"] + "元</span></li>";
        });
        $("#show_times").html(html);
      },
      error: function(result, status, xhr){

      }
    });
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
          "' name='timeSpan' checked='false' onclick='App.cinemaShowTimeChange(this);' >" 
          + value["show_time"] + " - " + value["price"] + "元</span></li>";
        });
        $("#show_times").html(html);
      },
      error: function(result, status, xhr){

      }
    });
  },
  cinemaShowTimeChange: function(span) {
    $('span[name="'+$(span).attr('name')+'"]').each(function(){
      if(this!=span) {
        this.className="unchecked";  
        this.checked=false;  
      }                 
    });  
    span.className="checked";  
    span.checked=true;
    $("#ticket_show_time_id").val($(span).attr("data-id"));
    $.ajax({
      url: "/hall_seats.json",
      type: "GET",
      dataType: "json",
      data: {
        show_time_id: $(span).attr("data-id")
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
            html += new_row + '<li><input type="checkbox" style="display:none;" name="seats[]" id="seat_' + value["id"] + '" value="' + value["id"] + 
        '"/><span data-id="' + value["id"] + '" class="unchecked" name="seatSpan" checked="false" onclick="App.cinemaSelectSeat(this);">' + value["row"] + '排' + value["col"] + '号</span></li>';
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
  },
  cinemaSelectSeat: function(span) {
    if(span.className == "checked") {
      span.className = "unchecked";
      span.checked=false;
      $("#seat_" + $(span).attr("data-id")).prop('checked',false)
    } else {
      span.className = "checked";
      span.checked=true;
      $("#seat_" + $(span).attr("data-id")).prop('checked',true)
    }
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
  },
  selectSeat: function(a) {
    if(a.className == "checked") {
      a.className = "unchecked";
      $(a).attr("style", "");
      $("#seat_" + $(a).attr("data-id")).prop('checked',false);
    } else {
      a.className = "checked";
      $(a).attr("style", "color: red;");
      $("#seat_" + $(a).attr("data-id")).prop('checked',true);
    }
  }
};

window.Product = {
  addToCart: function(el) {
    product_id = $(el).data("id");
    product_count = $("#quantity").val();
    $.ajax({
      url: "/line_items",
      type: "POST",
      data: {
        id: product_id,
        amount: product_count
      },
      success: function(result, status, xhr) {
        $("#notification").append("<div class='alert alert-success'>添加成功！<a href='#' class='close' 'data-dismiss'='alert'>x</a></div>");
      },
      error: function(result, status, xhr) {
        $("#notification").append("<div class='alert alert-danger'>请先登录,添加失败！<a href='#' class='close' 'data-dismiss'='alert'>x</a></div>");
      }
    });
  },
  changeGoodsBigPic: function() {
    var a = $("#goodsPicList");
    var b = a.children();
    var c = b.length;
    var d = $("#goodsPicPrev");
    var e = $("#goodsPicNext");
    var f = $("#goodsBigPic");
    var g = 0, h = null;
    d.height(d.parent().height()), e.height(e.parent().height()), 2 > c && (d.hide(), e.hide(), a.hide()), b.each(function() {
      0 === $(this).index() && $(this).addClass("current"), $(this).click(function() {
        {
          var a = $(this).index();
          $(this).children("img").attr("data-src")
        }
        g = a, h(g)
      })
    }), e.click(function() {
      g += 1, (g >= c || 0 > g) && (g = 0), h(g)
    }), d.click(function() {
      g -= 1, g >= c ? g = 0 : 0 > g && (g = c-1), h(g)
    }), h = function(a) {
      var c = b.eq(a).children("img").attr("data-src");
      c && f.attr("src", c), b.eq(g).addClass("current").siblings().removeClass("current")
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
            html += new_row + '<li><span class="checked">' + value["row"] + '排' + value["col"] + '号</span></li>';
          } else {
            html += new_row + '<li><span data-id="' + value["id"] + '" class="unchecked" name="seatSpan" checked="false" onclick="App.movieSelectSeat(this);">' + value["row"] + '排' + value["col"] + '号</span></li>';
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
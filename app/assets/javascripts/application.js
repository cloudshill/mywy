//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require payfor
//= require jquery.autosize
//= require jquery.validate
//= require bootstrap-editable.min
//= require video
//= require upload/vendor/jquery.ui.widget
//= require upload/jquery.iframe-transport
//= require upload/jquery.fileupload
//= require simditor
//= require select2
//= require select2_locale_zh-CN
//= require artDialog/artDialog
//= require turbolinks
//= require_self
//= require_tree ./plugins

window.App = {
	addToCart: function(el) {
		var item_id;
    item_id = $(el).data("id");
    variant = $('input:radio[name="variant"]:checked').val();
    if(variant == null){
      alert("请选中一个!");
      return false;
    }
	 	$.ajax({
	    url: "/line_items",
      type: "POST",
      data: {
        id: item_id,
        quantity: 1,
        variant: variant
	    },
      success: function(result, status, xhr) {
        var message = {message: "添加成功！马上跳转到购物车！", status: 'success', placement: 'bottom' };
        Essage.show(message, 3000);
        setTimeout(function() {
          location.href = '/carts';
        }, 1000);
	   	},
      error: function(result, status, xhr) {
        var message = {message: "请先登录,添加失败！", status: 'danger', placement: 'bottom' };
        Essage.show(message, 3000);
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

  addToFavoriteHeart: function(el) {
    var object_id = $(el).data("id");
    var object_type = $(el).data("type");
    if ($(el).data("state") != "favorited") {
      $.ajax({
        url: '/' + object_type + '/' + object_id + '/favorites',
        type: "POST"
      });
      $(el).data("state", "favorited").attr("class", "right pull-right btn-danger")
    } else{
      $.ajax({
        url: '/' + object_type + '/' + object_id + '/favorites/' + $(el).data("o"),
        type: "DELETE"
      });
      $(el).data("state", "").attr("class", "right pull-right btn-default")
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
            html += new_row + '<li><span class="checked">' + value["row"] + '排' + value["col"] + '号</span></li>';
          } else {
            html += new_row + '<li><input type="checkbox" style="display:none;" name="seats[]" id="seat_' + value["id"] + '" value="' + value["id"] + 
        '"/><span data-id="' + value["id"] + '" class="unchecked" name="seatSpan" checked="false" onclick="App.cinemaSelectSeat(this);">' + value["row"] + '排' + value["col"] + '号</span></li>';
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
  checkST: function() {
    if ($("#ticket_show_time_id").val() == "") {
      var message = {message: "你还未选择电影的场次！", status: 'error', placement: 'bottom' };
      Essage.show(message, 3000);
      return false;
    };
    return true;
  }
};

window.Product = {
  addToCart: function(el) {
    item_id = $(el).data("id");
    quantity = $("#quantity").val();
    variant = $('input:radio[name="variant"]:checked').val();
    if(variant == null){
      alert("请选中一个!");
      return false;
    }
    $.ajax({
      url: "/line_items",
      type: "POST",
      data: {
        id: item_id,
        quantity: quantity,
        variant: variant
      },
      success: function(result, status, xhr) {
        var message = {message: "添加成功！", status: 'success', placement: 'bottom' };
        Essage.show(message, 3000);
      },
      error: function(result, status, xhr) {
        var message = {message: "请先登录,添加失败！", status: 'danger', placement: 'bottom' };
        Essage.show(message, 3000);
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

$(document).on('page:update', function(){
  $('[data-behaviors~=autosize]').autosize();
});

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require jquery.autosize
//= require jquery.qeditor
//= require turbolinks
//= require cpanel/categories
//= require cpanel/movies

$(document).ready(function(){
    $('#myModal').on('hide.bs.modal', function () {
        $(this).removeData('bs.modal');
    });
    $("textarea").autoGrow();
    $("#product_description").qeditor({});
});

$(function(){
    $('#phone-navigation #phone-menu').change(function(){
        var url = $(this).val();
        if(url) {
            window.location = url;
        }
    });
});

var fancyFilter = function(filterListSelector, gallerySelector) {
    //Filter Button Code
    $(filterListSelector + ' a').click(function() {
        $(filterListSelector + ' li').removeClass('active');
        var $this = $(this);
        var filterType = $this.data('filter');
        if(!filterType) return true;

        $this.closest('li').addClass('active');
        $(gallerySelector).isotope({ 
            filter: filterType,
        });

        return false;
    });
};

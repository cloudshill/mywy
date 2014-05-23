//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require jquery.autosize
//= require jquery.validate
//= require upload/vendor/jquery.ui.widget
//= require upload/jquery.iframe-transport
//= require upload/jquery.fileupload
//= require simditor
//= require artDialog/artDialog
//= require turbolinks
//= require cpanel/categories
//= require cpanel/movies

$(document).ready(function(){
    $('[data-behaviors~=autosize]').autosize();
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

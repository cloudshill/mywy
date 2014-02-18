window.Movie = {
  getMovieFromDouban: function(){
    var douban_url = "https://api.douban.com/v2/movie/subject/" + $("#movie_douban_id").val();
    $.ajax({
      url: douban_url,
      type: "GET",
      dataType: "jsonp",
      success: function(result, status, xhr) {
        $("#movie_title").val(result["title"]);
        $("#movie_original_title").val(result["original_title"]);
        $("#movie_pubdate").val(result["pubdate"]);
        $("#movie_mainland_pubdate").val(result["mainland_pubdate"]);
        $("#movie_year").val(result["year"]);
        $("#movie_durations").val(result["durations"]);
        $("#cover").val(result["images"]["large"]);
        $("#movie_summary").val(result["summary"]);
        $("#movie_aka").val(result["aka"]);
        $("#movie_countries").val(result["countries"]);
        $("#movie_genres").val(result["genres"]);
        $("#movie_languages").val(result["languages"]);
        var r = "";
        jQuery.each( result["directors"], function( index, value ) {
          r += value["name"] + ",";
        });
        $("#movie_directors").val(r);
        r = "";
        jQuery.each( result["casts"], function( index, value ) {
          r += value["name"] + ",";
        });
        $("#movie_casts").val(r);
      },
      error: function(result, status, xhr) {
      }
    });
  }
};
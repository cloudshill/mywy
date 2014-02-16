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
        $("#movie_cover").val(result["images"]["medium"]);
        $("#movie_summary").val(result["summary"]);
      },
      error: function(result, status, xhr) {
      }
    });
  }
};
json.array!(@movie_movies) do |movie_movie|
  json.extract! movie_movie, :id, :title, :original_title, :pubdate, :mainland_pubdate, :year, :durations, :summary, :cover
  json.url movie_movie_url(movie_movie, format: :json)
end

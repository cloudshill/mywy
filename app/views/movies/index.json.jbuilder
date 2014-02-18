json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :original_title, :pubdate, :mainland_pubdate, :year, :durations, :summary, :cover
  json.url movie_url(movie, format: :json)
end

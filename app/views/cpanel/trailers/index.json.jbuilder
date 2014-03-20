json.array!(@trailers) do |trailer|
  json.extract! trailer, :id, :url, :movie_id
  json.url trailer_url(trailer, format: :json)
end

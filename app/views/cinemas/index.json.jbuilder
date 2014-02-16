json.array!(@cinemas) do |cinema|
  json.extract! cinema, :id, :name
  json.url cinema_url(cinema, format: :json)
end

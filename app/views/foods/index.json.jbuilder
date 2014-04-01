json.array!(@foods) do |food|
  json.extract! food, :id, :name, :price, :sales, :description, :node_id
  json.url food_url(food, format: :json)
end

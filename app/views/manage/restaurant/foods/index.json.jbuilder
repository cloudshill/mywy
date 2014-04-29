json.foods do
  json.array!(@foods) do |food|
    json.id food.id
    json.text food.name
  end
end

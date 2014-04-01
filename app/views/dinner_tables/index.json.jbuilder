json.array!(@dinner_tables) do |dinner_table|
  json.extract! dinner_table, :id, :name, :restaurant_id
  json.url dinner_table_url(dinner_table, format: :json)
end

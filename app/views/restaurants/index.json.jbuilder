json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :avatar, :guide, :member_id
  json.url restaurant_url(restaurant, format: :json)
end

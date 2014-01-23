json.array!(@pictures) do |picture|
  json.extract! picture, :id, :image, :is_cover, :product_id
  json.url picture_url(picture, format: :json)
end

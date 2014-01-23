json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :member_id, :product_id
  json.url comment_url(comment, format: :json)
end

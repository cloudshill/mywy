json.array!(@categories) do |category|
  json.extract! category, :id, :name, :sort, :node_id, :parent_id
  json.url category_url(category, format: :json)
end

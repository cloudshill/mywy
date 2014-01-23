json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :inprice, :inventory, :sales, :barcode, :node_id
  json.url product_url(product, format: :json)
end

json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :inprice, :inventory, :sales, :barcode, :node_id
  json.id product.id
  json.name product.name
  json.price product.price
  json.inventory product.inventory
  json.sales product.sales
  json.barcode product.barcode
  json.node_id product.node_id
  json.cover product.pictures.first.image.url("140x140")
  json.url product_url(product, format: :json)
end

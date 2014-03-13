json.id @product.id
json.name @product.name
json.price @product.price
json.inventory @product.inventory
json.sales @product.sales
json.barcode @product.barcode
json.node_id @product.node_id
json.created_at @product.created_at
json.updated_at @product.updated_at
json.pictures do
  json.array!(@product.pictures) do |picture|
    json.size50 picture.image.url("50x50")
    json.size140 picture.image.url("140x140")
    json.size500 picture.image.url("500x500")
  end
end
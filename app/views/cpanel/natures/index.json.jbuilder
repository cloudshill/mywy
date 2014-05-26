json.array!(@natures) do |nature|
  json.extract! nature, :id, :name, :sort, :product_id, :parent_id
end

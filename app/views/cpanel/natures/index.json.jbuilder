json.array!(@natures) do |nature|
  json.extract! nature, :id, :name, :sort, :node_id, :parent_id
end

json.option_types do
  json.array!(@option_types) do |option_type|
    json.id option_type.id
    json.text option_type.name
  end
end

json.array!(@addresses) do |address|
  json.extract! address, :id, :addressee, :address, :mobile, :is_default, :member_id
  json.url address_url(address, format: :json)
end

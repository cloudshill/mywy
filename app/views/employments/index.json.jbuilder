json.array!(@employments) do |employment|
  json.extract! employment, :id, :employmentable_id, :employmentable_type, :member_id
  json.url employment_url(employment, format: :json)
end

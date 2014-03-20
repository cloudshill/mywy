json.array!(@events) do |event|
  json.extract! event, :id, :body, :eventable_type, :eventable_id, :member_id, :start, :deadline
  json.url event_url(event, format: :json)
end

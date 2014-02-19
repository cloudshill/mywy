json.array!(@show_times) do |show_time|
  json.id show_time.id
  json.show_time formattime(show_time.show_time, :unit => "noDayOnlyHour")
end
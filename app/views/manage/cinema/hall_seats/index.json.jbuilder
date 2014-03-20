json.array!(@hall_seats) do |hall_seat|
  json.id hall_seat.id
  json.movie_hall_id hall_seat.movie_hall_id
  json.row hall_seat.row
  json.col hall_seat.col
  json.booking hall_seat.booking?(@show_time.id)
end
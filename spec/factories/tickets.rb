# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    member_id 1
    cinema_id 1
    movie_id 1
    movie_hall_id 1
    show_time_id 1
    hall_seat_id 1
    status "MyString"
  end
end

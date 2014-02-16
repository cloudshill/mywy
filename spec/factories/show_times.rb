# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :show_time do
    cinema_id 1
    movie_id 1
    movie_hall_id 1
    show_time "2014-02-15 08:21:20"
  end
end

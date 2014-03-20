# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    body "MyText"
    eventable_type "MyString"
    eventable_id 1
    member_id 1
    start "2014-03-19 14:00:52"
    deadline "2014-03-19 14:00:52"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill_item do
    quantity 1
    bill_id 1
    food_id 1
  end
end

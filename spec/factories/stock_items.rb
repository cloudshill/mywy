# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock_item do
    count_on_hand 1
    variant_id 1
  end
end

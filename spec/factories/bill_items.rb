# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill_item do
    amount 1
    bill_id 1
    bill_itemable_type "MyString"
    bill_itemable_id 1
  end
end

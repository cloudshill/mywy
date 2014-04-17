# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill do
    billable_type "MyString"
    billable_id 1
    table_id 1
    total_price "9.99"
    pay false
    discount "9.99"
  end
end

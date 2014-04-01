# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food do
    name "MyString"
    price "9.99"
    sales 1
    description "MyString"
    node_id 1
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    addressee "MyString"
    address "MyString"
    mobile "MyString"
    is_default false
    member_id 1
  end
end

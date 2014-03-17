# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employment do
    employmentable_id 1
    employmentable_type "MyString"
    member_id 1
  end
end

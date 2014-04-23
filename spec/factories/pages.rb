# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    pageable_type "MyString"
    pageable_id 1
    theme "MyString"
  end
end

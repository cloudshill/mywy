# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option_value do
    name "MyString"
    presentation "MyString"
    position 1
    option_type_id 1
  end
end

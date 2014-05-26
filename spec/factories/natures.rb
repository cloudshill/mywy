# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nature do
    name "MyString"
    node_id 1
    parent_id 1
    sort 1
  end
end

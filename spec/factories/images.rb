# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    image "MyString"
    imageable_type "MyString"
    imageable_id 1
    is_cover false
  end
end

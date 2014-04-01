# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wechat do
    shopable_type "MyString"
    shopable_id 1
    name "MyString"
    public_name "MyString"
    slogan "MyString"
    description "MyText"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wechat_text do
    keyword "MyString"
    context "MyText"
    match_type "MyString"
    wechat_id 1
  end
end

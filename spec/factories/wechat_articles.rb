# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wechat_article do
    keyword "MyString"
    match_type "MyString"
    title "MyString"
    sort 1
    picurl "MyString"
    description "MyText"
    link_url "MyString"
    show_cover false
    context "MyText"
    wechat_id 1
  end
end

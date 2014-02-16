# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    original_title "MyString"
    pubdate "2014-02-13"
    mainland_pubdate "2014-02-13"
    year 1
    durations "MyString"
    summary "MyString"
    cover "MyString"
  end
end

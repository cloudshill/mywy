# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :variant do
    sku "MyString"
    price "9.99"
    deleted_at "2014-05-29 16:25:41"
    is_master false
    product_id 1
    count_on_hand 1
    cost_price "9.99"
    position 1
  end
end

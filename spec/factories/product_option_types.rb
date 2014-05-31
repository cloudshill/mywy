# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_option_type do
    product nil
    option_type nil
    position 1
  end
end

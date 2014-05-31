class OptionType < ActiveRecord::Base
  has_many :option_values
  has_many :product_option_types, dependent: :destroy, inverse_of: :option_type
  has_many :products, through: :product_option_types
end

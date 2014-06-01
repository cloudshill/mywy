class Variant < ActiveRecord::Base
  belongs_to :product
  has_and_belongs_to_many :option_values
  has_many :line_items
end
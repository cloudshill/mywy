class Variant < ActiveRecord::Base
  belongs_to :product
  has_and_belongs_to_many :option_values
  has_many :line_items
  has_one :stock_item, :dependent => :destroy

  def name
    name = ""
    self.option_values.each do |option_value|
      name += "(#{option_value.option_type.presentation}:#{option_value.presentation}) "
    end
    name
  end
end

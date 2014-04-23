class Address < ActiveRecord::Base
  belongs_to :member
  has_one :order
end

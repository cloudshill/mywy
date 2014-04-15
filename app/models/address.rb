class Address < ActiveRecord::Base
  belongs_to :member

  
  def set_default
    
  end
end

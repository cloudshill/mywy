class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login

  validates :nickname, :uniqueness => { :case_sensitive => false }

  has_many :line_items
  has_many :products_in_cart, -> { where "order_id IS NULL" }, :through => :line_items, :source => :product
  has_many :favorites
  has_many :my_favorite_products, :through => :favorites, :source => :member
  has_many :comments
  has_many :orders

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
    	where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
       	where(conditions).first
    end
  end

  
end

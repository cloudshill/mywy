class Member < ActiveRecord::Base
  extend Enumerize
  enumerize :role, in: [:buyer, :seller], default: :buyer
  serialize :business_scope, Array
  enumerize :business_scope, in: [:cinema, :ktv, :catering], multiple: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  mount_uploader :avatar, ImageUploader

  attr_accessor :login, :uploader_secure_token

  has_one :employment

  has_many :line_items
  has_many :favorites
  has_many :comments
  has_many :orders
  has_many :tickets
  has_many :cinemas
  has_many :restaurants
  has_many :addresses

  belongs_to :ship_address, :class_name => "Address", :foreign_key => "ship_address_id"

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
    	where(conditions).where(["lower(mobile) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
       	where(conditions).first
    end
  end

  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Member.where(authentication_token: token).first
    end
  end

end

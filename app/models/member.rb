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

  validates :nickname, :uniqueness => { :case_sensitive => false }

  has_many :line_items
  has_many :favorites
  has_many :comments
  has_many :orders
  has_many :tickets
  has_many :cinemas

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
    	where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
       	where(conditions).first
    end
  end

end

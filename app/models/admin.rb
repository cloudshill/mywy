class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
    	where(conditions).where(["lower(email) = :value", { :value => login.downcase }]).first
    else
       	where(conditions).first
    end
  end

  def admin?
    Setting.admin_emails && Setting.admin_emails.include?(email)
  end
end

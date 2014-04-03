class Wechat < ActiveRecord::Base
  # It will auto generate weixin token and secret
  include WeixinRailsMiddleware::AutoGenerateWeixinTokenSecretKey

  extend Enumerize
  enumerize :account_type, in: [:subscribe, :subscribe_authorized, :service, :service_authorized], default: :subscribe
  enumerize :default_focus_method, in: [:text, :image_and_text], default: :text

  belongs_to :wechatable, polymorphic: true
  has_many :wechat_texts
end

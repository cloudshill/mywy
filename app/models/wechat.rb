class Wechat < ActiveRecord::Base
  # It will auto generate weixin token and secret
  include WeixinRailsMiddleware::AutoGenerateWeixinTokenSecretKey

  extend Enumerize
  enumerize :account_type, in: [:subscribe, :subscribe_authorized, :service, :service_authorized], default: :subscribe

  belongs_to :wechatable, polymorphic: true 
end

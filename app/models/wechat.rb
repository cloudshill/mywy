class Wechat < ActiveRecord::Base
  # It will auto generate weixin token and secret
  include WeixinRailsMiddleware::AutoGenerateWeixinTokenSecretKey

  belongs_to :wechatable, polymorphic: true 
end

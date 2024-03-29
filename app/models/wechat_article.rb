class WechatArticle < ActiveRecord::Base
  extend Enumerize
  enumerize :match_type, in: [:partial, :complete], default: :complete
  
  belongs_to :wechat
end

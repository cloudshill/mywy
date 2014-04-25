class WechatText < ActiveRecord::Base
  extend Enumerize
  enumerize :match_type, in: [:partial, :complete], default: :complete
  
  belongs_to :wechat

  validates :keyword, presence: true
  validates :context, presence: true
end

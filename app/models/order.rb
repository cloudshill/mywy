class Order < ActiveRecord::Base
	extend Enumerize

  enumerize :pay_method, in: [:offline, :online], default: :online
  enumerize :status,     in: [:opening, :pending, :paid, :completed, :canceled], default: :opening

  belongs_to :member
  belongs_to :address
  has_many :line_items

  validates :total_price, presence: true
  validates :receivable, presence: true
  validates :address_id, presence: true
  validates :pay_method, presence: true
  validates :status, presence: true
  validates :member_id, presence: true

  # 状态迁移方法

  def pend
    if status.opening?
      update_attribute :status => 'pending'
    end
  end

  # 只在 pending 状态可以 pay
  def pay
    if status.pending?
      add_plan # 业务逻辑，订单生效
      update_attribute :status, 'paid'
    end
  end

  # 只在 pending 和 paid 状态可以 complete
  def complete
    self.line_items.each do |line_item|
      line_item.variant.stock_item.count_on_hand -= line_item.quantity
      line_item.variant.sales_volume += line_item.quantity
      line_item.variant.stock_item.save
    end
    update_attribute :status, 'completed'
  end

  # 只在 pending 和 paid 状态可以 cancel
  def cancel
    if status.pending? or status.paid?
      remove_plan if status.paid? # 业务逻辑，取消订单
      update_attribute :status, 'canceled'
    end
  end

  def pay_url
    Alipay::Service.create_direct_pay_by_user_url(
      :out_trade_no      => id.to_s,
      :price             => receivable,
      :quantity          => '1',
      :discount          => '0',
      :subject           => "来自美月无忧 MeiYueWuYou.com 的订单！",
      :logistics_type    => 'DIRECT',
      :logistics_fee     => '0',
      :logistics_payment => 'SELLER_PAY',
      :return_url        => Rails.application.routes.url_helpers.order_url(self, :host => 'meiyuewuyou.com'),
      :notify_url        => Rails.application.routes.url_helpers.alipay_notify_orders_url(:host => 'meiyuewuyou.com'),
      :receive_name      => address.addressee, # 这里填写了收货信息，用户就不必填写
      :receive_address   => address.address,
      :receive_zip       => '100000',
      :receive_mobile    => address.mobile
    )
  end

  def send_good
    Alipay::Service.send_goods_confirm_by_platform(
      :trade_no => trade_no,
      :logistics_name => 'writings.io',
      :transport_type => 'DIRECT' # 无需物流
    )
  end
end

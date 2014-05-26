class OrdersController < ApplicationController
  before_filter :require_member
  before_action :set_order, only: [:show, :edit, :update, :destroy, :pay]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_member.orders.order("created_at desc")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @line_items = @order.line_items
  end

  # GET /orders/new
  def new
    @order = Order.new
    @line_items = current_member.line_items.where("id in (?)", params[:line_items])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_member.orders.build(order_params)
    @line_items = current_member.line_items.where("id in (?)", params[:line_items])
    @order.status = 'opening'
    @order.total_price = 0
    @line_items.each do |line_item|
      @order.total_price += (line_item.line_itemable.price * line_item.amount)
    end
    @order.receivable = @order.total_price

    respond_to do |format|
      if @order.save
        @line_items.each do |line_item|
          line_item.order_id = @order.id
          line_item.save
        end
        format.html { redirect_to @order, notice: '你的订单已经生成，确认无误后可以支付！' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: '你的订单已经更新成功！' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def pay
    if params[:agency] == "zfb"
      redirect_to @order.pay_url
    end
  end

  # 支付宝异步消息接口
  def alipay_notify
    notify_params = params.except(*request.path_parameters.keys)
    # 先校验消息的真实性
    if Alipay::Sign.verify?(notify_params) && Alipay::Notify.verify?(notify_params)
      # 获取交易关联的订单
      @order = Order.find params[:out_trade_no]

      case params[:trade_status]
      when 'WAIT_BUYER_PAY'
        # 交易开启
        @order.update_attribute :trade_no, params[:trade_no]
        @order.pend
      when 'WAIT_SELLER_SEND_GOODS'
        # 买家完成支付
        @order.pay
        # 虚拟物品无需发货，所以立即调用发货接口
        @order.send_good
      when 'TRADE_FINISHED'
        # 交易完成
        @order.complete
      when 'TRADE_CLOSED'
        # 交易被关闭
        @order.cancel
      end

      render :text => 'success' # 成功接收消息后，需要返回纯文本的 ‘success’，否则支付宝会定时重发消息，最多重试7次。 
    else
      render :text => 'error'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:member_id, :total_price, :address_id, :pay_method, :status)
    end
end

class OrdersController < ApplicationController
  before_filter :require_member
  before_action :set_order, only: [:show, :edit, :update, :destroy]

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
    if params[:order][:pay_method] == 'offline'
      @order.status = 'delivering'
    else
      @order.status = 'paying'
    end
    @order.total_price = 0
    @line_items.each do |line_item|
      @order.total_price += (line_item.line_itemable.price * line_item.amount)
    end

    respond_to do |format|
      if @order.save
        @line_items.each do |line_item|
          line_item.order_id = @order.id
          line_item.save
        end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
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
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:member_id, :total_price, :address, :pay_method, :status)
    end
end

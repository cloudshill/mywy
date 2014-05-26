class Cpanel::OrdersController < Cpanel::ApplicationController
	before_action :set_order, only: [:show, :edit, :update]

	def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to cpanel_orders_path, notice: '订单已经更新成功！' }
        format.json { head :no_content }
      else
        format.html { redirect_to cpanel_orders_path, notice: '订单已经更新成功！' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:receivable)
    end
end

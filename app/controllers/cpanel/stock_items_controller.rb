class Cpanel::StockItemsController < Cpanel::ApplicationController
  before_action :set_product
  before_action :set_stock_item, :only => [:edit, :destroy]

  def index
    @stock_items = @product.stock_items
    @stock_item = StockItem.new
  end

  def create
    @stock_item = StockItem.where("product_id = ? AND variant_id = ?", @product.id, params[:stock_item][:variant_id]).first
    if @stock_item.blank?
      @stock_item = @product.stock_items.build(stock_item_params)
    else
      @stock_item.count_on_hand += params[:stock_item][:count_on_hand].to_i
    end
    
    if @stock_item.save
      redirect_to cpanel_product_stock_items_path(@product), :notice => "添加成功！"
    else
      redirect_to cpanel_product_stock_items_path(@product), :notice => "添加失败！"
    end
  end

  def destroy
    @stock_item.destroy
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_item_params
      params.require(:stock_item).permit(:count_on_hand, :variant_id, :product_id)
    end
end
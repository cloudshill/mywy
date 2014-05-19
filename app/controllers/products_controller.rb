class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:node_id].blank?
      @products = Product.all
    else
      @node = Node.find(params[:node_id])
      categories = []
      if not params[:category].blank?
        categories = params[:category].split("-").delete_if { |c| c=="0" or c==""}
      end
      if categories.blank?
        @products = @node.products
      else
        @products = @node.products.joins(:categories).where(:categories_products => { :category_id => categories })
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comment = Comment.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :inprice, :inventory, :sales, :barcode, :node_id)
    end
end

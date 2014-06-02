class Cpanel::VariantsController < Cpanel::ApplicationController
  before_action :set_product
  before_action :set_variant, only: [:show, :edit, :update, :destroy]

  def index
    @variants = @product.variants
  end

  def new
    @variant = Variant.new
  end

  def create
    @variant = @product.variants.build(variant_params)
    if @variant.save
      redirect_to cpanel_product_variants_path(@product), :notice => "添加成功！"
    else
      render :new, :notice => "添加失败！"
    end
  end

  def destroy
    @variant.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_product_variants_path(@product), notice: '删除图片成功!' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variant_params
      params.require(:variant).permit(:sku, :price, :is_master, :count_on_hand, :cost_price, :position, {:option_value_ids => []})
    end
end

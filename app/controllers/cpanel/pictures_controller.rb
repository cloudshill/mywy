class Cpanel::PicturesController < Cpanel::ApplicationController
	before_action :set_product
	before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
  	@pictures = @product.pictures
  end

  def new
  	@picture = Picture.new
  	render :layout => false
  end

  def create
  	@picture = @product.pictures.build(picture_params)
  	@picture.save
  end

  def destroy
  	@picture.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_product_pictures_path(@product), notice: '删除图片成功!' }
      format.json { head :no_content }
    end
  end

  private
  	def set_product
  		@product = Product.find(params[:product_id])
  	end
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image, :is_cover, :product_id)
    end
end

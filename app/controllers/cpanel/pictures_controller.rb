class Cpanel::PicturesController < Cpanel::ApplicationController
	before_action :set_node_and_product
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

  	respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @picture }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
  end

  def destroy
  	@picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  private
  	def set_node_and_product
      @node = Node.find(params[:node_id])
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

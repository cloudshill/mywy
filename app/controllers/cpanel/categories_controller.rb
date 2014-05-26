class Cpanel::CategoriesController < Cpanel::ApplicationController
  before_action :set_node
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    if params[:id].to_i == 0
      @categories = @node.categories.where("parent_id = 0").order("id asc")
    else
      @categories = @node.categories.where(:parent_id => params[:id]).order("id asc")
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @node.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.json { @category }
      else
        format.json
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.js
      else
        format.js
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
      format.js
    end
  end

  def forming
    @node = Node.find(params[:node_id])
    @product = params[:product_id].blank? ? Product.new : Product.find(params[:product_id])
    render :layout => false
  end

  private
  	def set_node
  		@node = Node.find(params[:node_id])
  	end
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params[:category] = params[:tn]
      params.require(:category).permit(:name, :sort, :node_id, :parent_id)
    end
end


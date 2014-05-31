class Cpanel::ProductsController < Cpanel::ApplicationController
  before_action :set_node
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @search = Search.new(:product, params[:search])
    if params[:search].blank?
      if params[:node_id].blank?
        @products = Product.all.paginate(:page => params[:page], :per_page => 30)
      else
        categories = []
        if not params[:category].blank?
          categories = params[:category].split("-").delete_if { |c| c=="0" or c==""}
        end
        if categories.blank?
          @products = @node.products.paginate(:page => params[:page], :per_page => 30)
        else
          @products = @node.products.joins(:categories).where(:categories_products => { :category_id => categories }).paginate(:page => params[:page], :per_page => 30)
        end
      end
    else
      @search.order = 'name'
      @products = @search.run
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    if params[:product][:option_type_ids].present?
      params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
    end
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_cpanel_product_path(@product), notice: '商品生成成功！' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if params[:product][:option_type_ids].present?
      params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
    end
    params[:product][:category_ids] ||= []
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to edit_cpanel_product_path(@product), notice: '商品更新成功.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_node_products(@node), notice: '删除商品成功!' }
      format.json { head :no_content }
    end
  end

  def search
    
  end

  private
    def set_node
      @node = Node.find(params[:node_id]) if not params[:node_id].blank?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :inprice, :inventory, :sales, :barcode, :node_id, {:category_ids => []},
        {:nature_ids => []}, :sku, {:option_type_ids => []}, :description)
    end
end

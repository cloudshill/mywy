class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = LineItem.where("product_id = ? AND member_id = ? AND order_id IS NULL", params[:id], current_member.id).first
    if @line_item.blank?
      @line_item = LineItem.new
      @line_item.member_id = current_member.id
      @line_item.product_id = params[:id]
      @line_item.quantity = params[:quantity]
      @line_item.variant_id = params[:variant]
    else
      @line_item.quantity += params[:quantity].to_i
    end
  
    respond_to do |format|
      if @line_item.save!
        format.js { @success = 1 }
      else
        format.js { @success = 0 }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:quantity, :product_id, :variant_id)
    end
end

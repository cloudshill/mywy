class CartsController < ApplicationController
  before_filter :require_member
  # GET /carts
  # GET /carts.json
  def index
    @line_items = current_member.line_items.where("order_id IS NULL")
  end

end

class CartsController < ApplicationController
  before_filter :require_member
  # GET /carts
  # GET /carts.json
  def index
    @products = current_member.products_in_cart
  end

end

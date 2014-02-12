class CartsController < ApplicationController

  # GET /carts
  # GET /carts.json
  def index
    @products = current_or_guest_member.products_in_cart
  end

end

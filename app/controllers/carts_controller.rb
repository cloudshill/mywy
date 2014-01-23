class CartsController < ApplicationController

  # GET /carts
  # GET /carts.json
  def index
    if current_member.blank?
    else
      @products = current_member.products_in_cart
    end
  end

end

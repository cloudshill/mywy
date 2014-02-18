class HomeController < ApplicationController
  def index
    @movies = Movie.all
    @products = Product.all.order("sales ASC").limit(10)
  end

  def market
  end
end

class HomeController < ApplicationController
  def index
    @movies = Movie.all.limit(10)
    @products = Product.all.order("sales ASC").limit(10)
    @foods = Food.all.order("name ASC").limit(10)
  end
end

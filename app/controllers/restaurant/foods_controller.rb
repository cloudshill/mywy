class Restaurant::FoodsController < Restaurant::ApplicationController
  layout "wap"

  before_action :set_wap, only: [:show, :index]
  before_action :set_food, only: [:show]

  def index
    @foods = @wap.wechat.wechatable.foods
  end

  def show
    
  end

  private

  def set_wap
    @wap = Wap.find(params[:wap_id])
  end

  def set_food
    @food = Food.find(params[:id])
  end
end

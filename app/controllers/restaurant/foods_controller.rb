class Restaurant::FoodsController < Restaurant::ApplicationController
  layout "wap"

  before_action :set_wap, only: [:show, :index, :search]
  before_action :set_food, only: [:show]
  before_action :set_nodes

  def index
    if params[:node_id].blank?
      @foods = @wap.wechat.wechatable.foods
    else
      @foods = @wap.wechat.wechatable.foods.where(:node_id => params[:node_id])
    end
  end

  def show
    
  end

  def search
    @search = Search.new(:food, params[:search], :per_page => 2)
    @search.order = 'name'
    @foods = @search.run
  end

  private

  def set_wap
    @wap = Wap.find(params[:wap_id])
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def set_nodes
    @nodes = Node.where("business_scope = 'restaurant'")
  end
end

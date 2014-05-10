class Restaurant::WapsController < Restaurant::ApplicationController
  layout "wap"
  
  before_action :set_wap
  before_action :set_nodes
  
  def show
    @foods = @wap.wechat.wechatable.foods
  end

  private

  def set_wap
    @wap = Wap.find(params[:id])
  end

  def set_nodes
    @nodes = Node.where("business_scope = 'restaurant'")
  end
end

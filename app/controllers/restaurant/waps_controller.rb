class Restaurant::WapsController < Restaurant::ApplicationController
  before_action :set_wap
  
  def show
    @foods = @wap.wechat.wechatable.foods
  end

  private

  def set_wap
    @wap = Wap.find(params[:id])
  end
end

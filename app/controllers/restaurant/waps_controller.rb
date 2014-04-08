class Restaurant::WapsController < Restaurant::ApplicationController
  before_action :set_wap
  
  def show
    
  end

  private

  def set_wap
    @wap = Wap.find(params[:id])
  end
end

class Manage::Restaurant::WapsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update]
  before_action :set_wechat, only: [:edit, :update]
  before_action :set_wap, only: [:edit, :update]

  def edit
    
  end

  def update
    @wap.update wap_params
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_wechat
    @wechat = Wechat.find(params[:wechat_id])
  end

  def set_wap
    @wap = Wap.find(params[:id])
  end

  def wap_params
    params.require(:wap).permit(:keyword, :title, :match_type, :wechat_id, :cover, :logo)
  end
end

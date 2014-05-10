class Manage::Restaurant::DiymenusController < Manage::ApplicationController
  before_action :set_restaurant, only: [:index, :create, :update]
  before_action :set_wechat, only: [:index, :create, :update]

  def index
    @diymenus = @wechat.diymenus.where(:parent_id => nil)
  end

  def create
    @diymenu = @wechat.diymenus.build(diymenu_params)
    @diymenu.save
  end

  def update
    
  end

  def destroy
    
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_wechat
    @wechat = Wechat.find(params[:wechat_id])
  end

  def diymenu_params
    params.require(:diymenu).permit(:wechat_id, :parent_id, :name, :key, :is_show, :url, :sort)
  end
end

class Manage::Restaurant::DiymenusController < Manage::ApplicationController
  before_action :set_restaurant, only: [:index, :create, :update, :generate_menu]
  before_action :set_wechat, only: [:index, :create, :update, :generate_menu]

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

  def generate_menu
    if @wechat.account_type.subscribe?
      msg = "你目前是订阅号，需要填写app_id和app_secret授权才能使用此功能！"
      redirect_to manage_restaurant_restaurant_wechat_diymenus_path(@restaurant, @wechat), notice: msg
    else
      weixin_client = WeixinAuthorize::Client.new(@wechat.app_id, @wechat.app_secret)
      if weixin_client.is_valid?
        menu   = @wechat.build_menu
        result = weixin_client.create_menu(menu)
        set_error_message(result["errmsg"]) if result["errcode"] != 0
        msg = "菜单生成成功！"
      else
        msg = "app_key和app_secret验证错误！请在授权页面检查!"
      end
      redirect_to manage_restaurant_restaurant_wechat_diymenus_path(@restaurant, @wechat), notice: msg
    end
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

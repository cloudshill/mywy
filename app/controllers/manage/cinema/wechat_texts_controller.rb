class Manage::Restaurant::WechatTextsController < ApplicationController
  before_action :set_restaurant, only: [:index, :new, :create, :edit, :update]
  before_action :set_wechat, only: [:index, :new, :create, :edit, :update]
  before_action :set_wechat_text, only: [:edit, :update, :destroy]

  def index
    @wechat_texts = @wechat.wechat_texts
  end

  def new
    @wechat_text = WechatText.new
  end

  def create
    @wechat_text = @wechat.wechat_texts.build(wechat_text_params)
    @wechat_text.save
  end

  def edit
    
  end

  def update
    @wechat_text.update wechat_text_params
  end

  def destroy
    @wechat_text.destroy
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_wechat
    @wechat = Wechat.find(params[:wechat_id])
  end

  def set_wechat_text
    @wechat_text = WechatText.find(params[:id])
  end

  def wechat_text_params
    params.require(:wechat_text).permit(:keyword, :context, :match_type, :wechat_id)
  end
end

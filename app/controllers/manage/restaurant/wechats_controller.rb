class Manage::Restaurant::WechatsController < ApplicationController
  before_action :set_restaurant, only: [:show, :new, :create, :edit, :authorize, :replyset, :focusset]
  before_action :set_wechat, only: [:show, :edit, :update, :destroy, :authorize, :replyset, :focusset]

  def show
    
  end

  def new
    @wechat = Wechat.new
  end

  def create
    @wechat = Wechat.new(wechat_params)
    @wechat.wechatable = @restaurant
    @wechat.save
    @wap = Wap.create(:wechat_id => @wechat.id)
  end

  def edit
    
  end

  def authorize
    
  end

  def replyset
    
  end

  def focusset
    
  end

  def update
    @wechat.update wechat_params
  end

  def destroy
    
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_wechat
    @wechat = Wechat.find(params[:id])
  end

  def wechat_params
    params.require(:wechat).permit(:name, :public_name, :slogan, :description, :account_type, :app_id, :app_secret, 
      :default_focus_method, :default_reply_no_match, :default_reply_no_match_flag, :lbs_distance, :focus_reply)
  end
end















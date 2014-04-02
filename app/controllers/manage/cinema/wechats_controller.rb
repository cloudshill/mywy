class Manage::Cinema::WechatsController < ApplicationController
  before_action :set_cinema, only: [:show, :new, :create, :edit]
  before_action :set_wechat, only: [:show, :edit, :update, :destroy]

  def show
    
  end

  def new
    @wechat = Wechat.new
  end

  def create
    @wechat = Wechat.new(wechat_params)
    @wechat.wechatable = @cinema
    @wechat.save
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def set_cinema
    @cinema = Cinema.find(params[:cinema_id])
  end

  def set_wechat
    @wechat = Wechat.find(params[:id])
  end

  def wechat_params
    params.require(:wechat).permit(:name, :public_name, :slogan, :description)
  end
end

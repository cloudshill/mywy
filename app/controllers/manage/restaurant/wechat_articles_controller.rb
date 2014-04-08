class Manage::Restaurant::WechatArticlesController < ApplicationController
  before_action :set_restaurant, only: [:index, :new, :create, :edit, :update]
  before_action :set_wechat, only: [:index, :new, :create, :edit, :update]
  before_action :set_wechat_article, only: [:edit, :update, :destroy]

  def index
    @wechat_articles = @wechat.wechat_articles
  end

  def new
    @wechat_article = WechatArticle.new
  end

  def create
    @wechat_article = @wechat.wechat_articles.build(wechat_article_params)
    @wechat_article.save
  end

  def edit
    
  end

  def update
    @wechat_article.update wechat_article_params
  end

  def destroy
    @wechat_article.destroy
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_wechat
    @wechat = Wechat.find(params[:wechat_id])
  end

  def set_wechat_article
    @wechat_article = WechatArticle.find(params[:id])
  end

  def wechat_article_params
    params.require(:wechat_article).permit(:keyword, :context, :match_type, :wechat_id, :show_cover, :picurl, :title, :sort, :description, :link_url)
  end
end

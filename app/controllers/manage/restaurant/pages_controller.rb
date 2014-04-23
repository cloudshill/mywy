class Manage::Page::RestaurantsController < ApplicationController
  before_action :set_page, only: [:edit, :update]

  def edit
    
  end

  def update
    @page.update params_page
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def params_page
    params.require(:page).permit(:theme)
  end
end
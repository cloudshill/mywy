class Restaurant::PagesController < Restaurant::ApplicationController
  before_action :set_page
  
  def show
    html = Liquid::Template.parse().render()
    render text: html
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end
end

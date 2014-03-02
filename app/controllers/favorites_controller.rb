class FavoritesController < ApplicationController
	before_filter :require_member
  before_action :set_favoriteable, only: [:create, :destroy]

  def index
    @favorites_is_product = current_member.favorites.where("favoriteable_type = ?", "Product")
  end

  def create
    @favorite = @favoriteable.favorites.build
    @favorite.member_id = current_member.id

    respond_to do |format|
      if @favorite.save
        format.js { @success = 1 }
      else
        format.js { @success = 0 }
      end
    end
  end

  def destroy
  	@favorite = Favorite.where("member_id = ? AND favoriteable_id = ? AND favoriteable_type = ?", current_member.id, @favoriteable.id, @favoriteable.class.name)
  	@favorite.destroy_all
  end

  private
    def set_favoriteable
      @favoriteable = find_favoriteable
    end

    def find_favoriteable   
      params.each do |name, value|     
        if name =~ /(.+)_id$/     
          return $1.classify.constantize.find(value)     
        end    
      end    
      nil    
    end
end

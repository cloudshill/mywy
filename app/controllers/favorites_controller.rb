class FavoritesController < ApplicationController
	before_filter :require_member

  def create
  	@favorite = Favorite.new
  	@favorite.member_id = current_or_guest_member.id
  	@favorite.product_id = params[:id]
  	if @favorite.save
  		
  	else
  		
  	end
  end

  def destroy
  	@favorite = Favorite.where("member_id = ? AND product_id = ?", current_or_guest_member.id, params[:id])
  	@favorite.destroy_all
  end
end

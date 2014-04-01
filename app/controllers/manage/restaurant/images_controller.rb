class Manage::Restaurant::ImagesController < ApplicationController
  before_action :set_restaurant_and_food, only: [:index]
  before_action :set_imageable, only: [:index, :create]

  def index
    @images = @imageable.images
  end

  def create
    @image = @imageable.images.build(image_params)
    @image.member_id = current_member.id
    @image.save!
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
  end

  private

  def set_imageable
    @imageable = find_imageable
  end

  def find_imageable
    params.each do |name, value|     
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value) if $1 != 'restaurant'
      end    
    end    
    nil    
  end

  def set_restaurant_and_food
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:food_id])
  end

  def image_params
    params.require(:image).permit(:image, :is_cover, :imageable_type, :imageable_id)
  end

end

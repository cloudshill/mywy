class Manage::Restaurant::BillsController < ApplicationController

  before_action :set_restaurant, only: [:show, :new, :create, :edit]

  def new
    @bill = Bill.new
  end

  def create
    
  end

  def edit
    
  end

  def update
    @bill.update bill_params
  end

  private

  def set_bill
    
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def bill_params
    params.require(:bill).permit()
  end
end

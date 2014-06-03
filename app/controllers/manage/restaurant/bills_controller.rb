class Manage::Restaurant::BillsController < Manage::ApplicationController

  before_action :set_restaurant, only: [:show, :new, :create, :edit, :index]
  before_action :set_bill, only: [:show, :edit, :update, :destroy, :checkout]

  def index
    
  end

  def show
    
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.restaurant_id = @restaurant.id
    @bill.sn = @restaurant.id.to_s + Time.now.to_i.to_s
    if @bill.save
      redirect_to manage_restaurant_restaurant_bill_path(@restaurant, @bill), :notice => '创建销售单成功！'
    else
      render :new, :notice => '创建失败！请联系客服！'
    end
  end

  def edit
    
  end

  def update
    @bill.update bill_params
  end

  def checkout
    @bill.total_price = 0
    @bill.bill_items.each do |bill_item|
      @bill.total_price += (bill_item.food.price * bill_item.quantity)
    end
    @bill.checkout = true
    @bill.save
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def bill_params
    params.require(:bill).permit(:is_takeout, :table_id, :paidin)
  end
end

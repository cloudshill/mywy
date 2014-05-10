class Manage::Restaurant::BillItemsController < Manage::ApplicationController
  before_action :set_restaurant, only: [:create, :update]
  before_action :set_bill, only: [:create, :update]
  before_action :set_bill_item, only: [:update]

  def create
    @bill_item = BillItem.new(params_bill_item)
    @bill_item.bill_id = @bill.id
    @bill_item.save
  end

  def update
    if not params[:pk].blank?
      if params[:update_attr] == "amount"
        params[:bill_item][:amount] = params[:value]
      end
    end
    respond_to do |format|
      if @bill_item.update params_bill_item
        format.json { head :no_content }
      else
        format.json { render json: @movie_hall.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])  
  end

  def set_bill
    @bill = Bill.find(params[:bill_id])
  end

  def set_bill_item
    @bill_item = BillItem.find(params[:id])
  end

  def params_bill_item
    params.require(:bill_item).permit(:bill_itemable_id, :amount, :bill_itemable_type)
  end
end

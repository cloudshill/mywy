class Account::AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy, :set_ship_address]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = current_member.addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = current_member.addresses.build(address_params)
    @address.save
    if params[:comeback] == "new_order"
      current_member.ship_address_id = @address.id
      current_member.save
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: '地址已经修改成功了！' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to account_addresses_path }
      format.json { head :no_content }
    end
  end

  def set_ship_address
    current_member.ship_address_id = @address.id
    current_member.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:addressee, :address, :mobile, :is_default, :member_id)
    end
end

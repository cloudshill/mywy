class Manage::Restaurant::DinnerTablesController < Manage::ApplicationController
  before_action :set_dinner_table, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:index, :create, :new]

  # GET /dinner_tables
  # GET /dinner_tables.json
  def index
    @dinner_tables = @restaurant.dinner_tables
  end

  # GET /dinner_tables/1
  # GET /dinner_tables/1.json
  def show
  end

  # GET /dinner_tables/new
  def new
    @dinner_table = DinnerTable.new
  end

  # GET /dinner_tables/1/edit
  def edit
  end

  # POST /dinner_tables
  # POST /dinner_tables.json
  def create
    @dinner_table = @restaurant.dinner_tables.new(dinner_table_params)

    respond_to do |format|
      if @dinner_table.save
        format.html { redirect_to @dinner_table, notice: 'Dinner table was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dinner_table }
      else
        format.html { render action: 'new' }
        format.json { render json: @dinner_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinner_tables/1
  # PATCH/PUT /dinner_tables/1.json
  def update
    respond_to do |format|
      if @dinner_table.update(dinner_table_params)
        format.html { redirect_to @dinner_table, notice: 'Dinner table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dinner_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinner_tables/1
  # DELETE /dinner_tables/1.json
  def destroy
    @dinner_table.destroy
    respond_to do |format|
      format.html { redirect_to dinner_tables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinner_table
      @dinner_table = DinnerTable.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinner_table_params
      params.require(:dinner_table).permit(:name, :restaurant_id)
    end
end

class EmploymentsController < ApplicationController
  before_action :set_employmentable, only: [:show, :edit, :update, :destroy]
  before_action :set_cinema, only: [:index, :new, :create]

  # GET /employments
  # GET /employments.json
  def index
    @employments = Employment.all
  end

  # GET /employments/1
  # GET /employments/1.json
  def show
  end

  # GET /employments/new
  def new
    @employment = Employment.new
  end

  # GET /employments/1/edit
  def edit
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = @employmentable.employments.build(employment_params)

    respond_to do |format|
      if @employment.save
        format.html { redirect_to @employment, notice: 'Employment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employment }
      else
        format.html { render action: 'new' }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employments/1
  # PATCH/PUT /employments/1.json
  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.html { redirect_to @employment, notice: 'Employment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to employments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employmentable
      @employmentable = find_employmentable
    end

    def find_employmentable  
      params.each do |name, value|     
        if name =~ /(.+)_id$/     
          return $1.classify.constantize.find(value)     
        end    
      end    
      nil    
    end

    def set_cinema
      if not params[:cinema_id].blank?
        @cinema = Cinema.find(params[:cinema_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_params
      params.require(:employment).permit(:employmentable_id, :employmentable_type, :member_id)
    end
end

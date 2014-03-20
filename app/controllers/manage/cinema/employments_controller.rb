class Manage::Cinema::EmploymentsController < ApplicationController
  before_action :set_employmentable, only: [:update, :destroy]
  before_action :set_cinema, only: [:index, :update]
  before_action :set_employment, only: [:update, :destroy]

  # GET /employments
  # GET /employments.json
  def index
    @employments = @cinema.employments
  end

  # PATCH/PUT /employments/1
  # PATCH/PUT /employments/1.json
  def update
    if not params[:pk].blank?
      params[:employment][:status] = params[:value]
    end
    respond_to do |format|
      if @employment.update(employment_params)
        format.js { @notice = 'Employment was successfully updated.' }
        format.json { head :no_content }
      else
        format.js { @notice = 'Employment was successfully updated.' }
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

    def set_employment
      @employment = Employment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_params
      params.require(:employment).permit(:employmentable_id, :employmentable_type, :member_id, :status)
    end
end

class EmploymentsController < ApplicationController
  before_action :set_employmentable, only: [:show, :create]
  before_action :set_cinema, only: [:index, :create]
  before_action :set_employment, only: [:update, :show]

  # GET /employments
  # GET /employments.json
  def index
    @employments = Employment.all
  end

  # GET /employments/1
  # GET /employments/1.json
  def show
  end

  # POST /employments
  # POST /employments.json
  def create
    if current_member.id == @employmentable.member.id
      respond_to do |format|
        format.js { @info = "创始人不能应聘！" }
      end
    else
      @employment = @employmentable.employments.build
      @employment.member_id  = current_member.id

      respond_to do |format|
        if @employment.save
          format.js { @info = "应聘成功！请耐心等待审核！" }
        else
          format.js { @info = "应聘失败了！" }
        end
      end
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

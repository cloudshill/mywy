class Manage::Cinema::CinemasController < Manage::ApplicationController
  before_filter :require_member, only: [:index, :new, :edit, :create, :update, :destroy]
  before_filter :require_cinema_owner_or_employee, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_cinema, only: [:show, :edit, :update, :destroy, :employment, :comments]

  layout "cinema", only: [:show, :employment, :comments]

  # GET /cinemas
  # GET /cinemas.json
  def index
    @cinemas = []
    if is_cinema_employee?
      @cinemas << current_member.employment.cinema
    else
      @cinemas = current_member.cinemas.all
    end
  end

  # GET /cinemas/1
  # GET /cinemas/1.json
  def show
    @show_times_today = @cinema.show_times.where(:show_time => ((Date.current.beginning_of_day)..(Date.current.end_of_day))).order("show_time ASC")
    @show_times_tomorrow = @cinema.show_times.where(:show_time => ((Date.current.beginning_of_day + 216000)..(Date.current.end_of_day + 216000))).order("show_time ASC")
  end

  def employment
    @employment = Employment.new
  end

  def comments
    
  end

  # GET /cinemas/new
  def new
    @cinema = Cinema.new
  end

  # GET /cinemas/1/edit
  def edit
  end

  # POST /cinemas
  # POST /cinemas.json
  def create
    @cinema = current_member.cinemas.build(cinema_params)
    @page = Page.create(:pageable => @cinema)
    respond_to do |format|
      if @cinema.save
        format.html { redirect_to manage_cinema_cinemas_path, notice: 'Cinema was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cinema }
      else
        format.html { render action: 'new' }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cinemas/1
  # PATCH/PUT /cinemas/1.json
  def update
    if not params[:pk].blank?
      params[:cinema][:name] = params[:value]
    end
    respond_to do |format|
      if @cinema.update(cinema_params)
        format.js
        format.json { head :no_content }
      else
        format.js
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cinemas/1
  # DELETE /cinemas/1.json
  def destroy
    @cinema.destroy
    respond_to do |format|
      format.html { redirect_to cinemas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cinema_params
      params.require(:cinema).permit(:name, :avatar, :guide)
    end
end

class Cpanel::CinemasController < Cpanel::ApplicationController
  before_action :set_cinema, only: [:show, :edit, :update, :destroy]

  def index
    @cinemas = Cinema.all
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.new(cinema_params)

    respond_to do |format|
      if @cinema.save
        format.html { redirect_to cpanel_cinemas_path, notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cinema }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
  end

  def edit
    
  end

  def update
    
  end

  def show
    
  end

  def destroy
    @cinema.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_cinemas_path }
      format.json { head :no_content }
    end
  end

  private

  def set_cinema
    @cinema = Cinema.find(params[:id])
  end

  def cinema_params
    params.require(:cinema).permit(:name)
  end
end
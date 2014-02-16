class Cpanel::MoviesController < Cpanel::ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to cpanel_movie_path(@movie), notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
        format.js { @success = 1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
  end

  def show

  end

  def edit
    
  end

  def update
    
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_movies_path }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :original_title, :pubdate, :mainland_pubdate, :year, :durations, :summary, :cover)
  end
end
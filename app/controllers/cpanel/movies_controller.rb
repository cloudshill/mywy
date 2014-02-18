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
    @movie.cover = Movie.download_file(params[:cover])
    @movie.aka = @movie.aka.split(",")
    @movie.countries = @movie.countries.split(",")

    respond_to do |format|
      if @movie.save
        format.html { redirect_to cpanel_movie_path(@movie), notice: 'Movie was successfully created.' }
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
    params[:movie][:aka] = params[:movie][:aka].split(",")
    params[:movie][:directors] = params[:movie][:directors].split(",")
    params[:movie][:casts] = params[:movie][:casts].split(",")
    #params[:movie][:writers] = params[:movie][:writers].split(",")
    #params[:movie][:pubdates] = params[:movie][:pubdates].split(",")
    params[:movie][:languages] = params[:movie][:languages].split(",")
    params[:movie][:genres] = params[:movie][:genres].split(",")
    params[:movie][:countries] = params[:movie][:countries].split(",")
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to cpanel_movie_path(@movie), notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
        format.js { @success = 1 }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
        format.js { @success = 2 }
      end
    end
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
    params.require(:movie).permit(:title, :original_title, :pubdate, :mainland_pubdate, :year, :durations, :summary, :cover, 
      :douban_id, {:aka => [], :directors => [], :casts => [], :writers => [], :pubdates => [], :languages => [], :genres => [], :countries => []})
  end
end
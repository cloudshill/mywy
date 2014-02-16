class Movie::MoviesController < ApplicationController
  before_action :set_movie_movie, only: [:show, :edit, :update, :destroy]

  # GET /movie/movies
  # GET /movie/movies.json
  def index
    @movie_movies = Movie::Movie.all
  end

  # GET /movie/movies/1
  # GET /movie/movies/1.json
  def show
  end

  # GET /movie/movies/new
  def new
    @movie_movie = Movie::Movie.new
  end

  # GET /movie/movies/1/edit
  def edit
  end

  # POST /movie/movies
  # POST /movie/movies.json
  def create
    @movie_movie = Movie::Movie.new(movie_movie_params)

    respond_to do |format|
      if @movie_movie.save
        format.html { redirect_to @movie_movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie_movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie/movies/1
  # PATCH/PUT /movie/movies/1.json
  def update
    respond_to do |format|
      if @movie_movie.update(movie_movie_params)
        format.html { redirect_to @movie_movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie/movies/1
  # DELETE /movie/movies/1.json
  def destroy
    @movie_movie.destroy
    respond_to do |format|
      format.html { redirect_to movie_movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_movie
      @movie_movie = Movie::Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_movie_params
      params.require(:movie_movie).permit(:title, :original_title, :pubdate, :mainland_pubdate, :year, :durations, :summary, :cover)
    end
end

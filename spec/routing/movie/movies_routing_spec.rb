require "spec_helper"

describe Movie::MoviesController do
  describe "routing" do

    it "routes to #index" do
      get("/movie_movies").should route_to("movie_movies#index")
    end

    it "routes to #new" do
      get("/movie_movies/new").should route_to("movie_movies#new")
    end

    it "routes to #show" do
      get("/movie_movies/1").should route_to("movie_movies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/movie_movies/1/edit").should route_to("movie_movies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/movie_movies").should route_to("movie_movies#create")
    end

    it "routes to #update" do
      put("/movie_movies/1").should route_to("movie_movies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/movie_movies/1").should route_to("movie_movies#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe TrailersController do
  describe "routing" do

    it "routes to #index" do
      get("/trailers").should route_to("trailers#index")
    end

    it "routes to #new" do
      get("/trailers/new").should route_to("trailers#new")
    end

    it "routes to #show" do
      get("/trailers/1").should route_to("trailers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trailers/1/edit").should route_to("trailers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trailers").should route_to("trailers#create")
    end

    it "routes to #update" do
      put("/trailers/1").should route_to("trailers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trailers/1").should route_to("trailers#destroy", :id => "1")
    end

  end
end

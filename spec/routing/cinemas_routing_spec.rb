require "spec_helper"

describe CinemasController do
  describe "routing" do

    it "routes to #index" do
      get("/cinemas").should route_to("cinemas#index")
    end

    it "routes to #new" do
      get("/cinemas/new").should route_to("cinemas#new")
    end

    it "routes to #show" do
      get("/cinemas/1").should route_to("cinemas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cinemas/1/edit").should route_to("cinemas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cinemas").should route_to("cinemas#create")
    end

    it "routes to #update" do
      put("/cinemas/1").should route_to("cinemas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cinemas/1").should route_to("cinemas#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe DinnerTablesController do
  describe "routing" do

    it "routes to #index" do
      get("/dinner_tables").should route_to("dinner_tables#index")
    end

    it "routes to #new" do
      get("/dinner_tables/new").should route_to("dinner_tables#new")
    end

    it "routes to #show" do
      get("/dinner_tables/1").should route_to("dinner_tables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dinner_tables/1/edit").should route_to("dinner_tables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dinner_tables").should route_to("dinner_tables#create")
    end

    it "routes to #update" do
      put("/dinner_tables/1").should route_to("dinner_tables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dinner_tables/1").should route_to("dinner_tables#destroy", :id => "1")
    end

  end
end

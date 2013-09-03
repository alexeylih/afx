require "spec_helper"

describe BallsController do
  describe "routing" do

    it "routes to #index" do
      get("/balls").should route_to("balls#index")
    end

    it "routes to #new" do
      get("/balls/new").should route_to("balls#new")
    end

    it "routes to #show" do
      get("/balls/1").should route_to("balls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/balls/1/edit").should route_to("balls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/balls").should route_to("balls#create")
    end

    it "routes to #update" do
      put("/balls/1").should route_to("balls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/balls/1").should route_to("balls#destroy", :id => "1")
    end

  end
end

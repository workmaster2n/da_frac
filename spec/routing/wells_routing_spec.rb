require "spec_helper"

describe WellsController do
  describe "routing" do

    it "routes to #index" do
      get("/wells").should route_to("wells#index")
    end

    it "routes to #new" do
      get("/wells/new").should route_to("wells#new")
    end

    it "routes to #show" do
      get("/wells/1").should route_to("wells#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wells/1/edit").should route_to("wells#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wells").should route_to("wells#create")
    end

    it "routes to #update" do
      put("/wells/1").should route_to("wells#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wells/1").should route_to("wells#destroy", :id => "1")
    end

  end
end

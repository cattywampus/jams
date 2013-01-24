require "spec_helper"

describe DinnerEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/dinner_events").should route_to("dinner_events#index")
    end

    it "routes to #new" do
      get("/dinner_events/new").should route_to("dinner_events#new")
    end

    it "routes to #show" do
      get("/dinner_events/1").should route_to("dinner_events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dinner_events/1/edit").should route_to("dinner_events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dinner_events").should route_to("dinner_events#create")
    end

    it "routes to #update" do
      put("/dinner_events/1").should route_to("dinner_events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dinner_events/1").should route_to("dinner_events#destroy", :id => "1")
    end

  end
end

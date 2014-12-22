require "spec_helper"

describe JudgesController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/judges")).to route_to("judges#index")
    end

    it "routes to #new" do
      expect(get("/judges/new")).to route_to("judges#new")
    end

    it "routes to #show" do
      expect(get("/judges/1")).to route_to("judges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/judges/1/edit")).to route_to("judges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/judges")).to route_to("judges#create")
    end

    it "routes to #update" do
      expect(put("/judges/1")).to route_to("judges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/judges/1")).to route_to("judges#destroy", :id => "1")
    end

  end
end

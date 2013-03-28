require "spec_helper"

describe DinnerEventsController do
  describe "routing" do

    let(:dinner_event) { create :dinner_event }
    let(:event) { dinner_event.event }
    let(:dinner_path) { "/events/#{event.to_param}/dinner"}
    it "routes to #new" do
      get("#{dinner_path}/new").should route_to("dinner_events#new", :event_id => event.to_param)
    end

    it "routes to #show" do
      get("#{dinner_path}").should route_to("dinner_events#show", :event_id => event.to_param)
    end

    it "routes to #edit" do
      get("#{dinner_path}/edit").should route_to("dinner_events#edit", :event_id => event.to_param)
    end

    it "routes to #create" do
      post("#{dinner_path}").should route_to("dinner_events#create", :event_id => event.to_param)
    end

    it "routes to #update" do
      put("#{dinner_path}").should route_to("dinner_events#update", :event_id => event.to_param)
    end

    it "routes to #destroy" do
      delete("#{dinner_path}").should route_to("dinner_events#destroy", :event_id => event.to_param)
    end

  end
end

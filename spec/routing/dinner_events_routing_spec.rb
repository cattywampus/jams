require "spec_helper"

describe DinnerEventsController do
  describe "routing" do

    let(:dinner_event) { create :dinner_event }
    let(:event) { dinner_event.event }
    let(:dinner_path) { "/events/#{event.to_param}/dinner"}
    it "routes to #new" do
      expect(get("#{dinner_path}/new")).to route_to("dinner_events#new", :event_id => event.to_param)
    end

    it "routes to #show" do
      expect(get("#{dinner_path}")).to route_to("dinner_events#show", :event_id => event.to_param)
    end

    it "routes to #edit" do
      expect(get("#{dinner_path}/edit")).to route_to("dinner_events#edit", :event_id => event.to_param)
    end

    it "routes to #create" do
      expect(post("#{dinner_path}")).to route_to("dinner_events#create", :event_id => event.to_param)
    end

    it "routes to #update" do
      expect(put("#{dinner_path}")).to route_to("dinner_events#update", :event_id => event.to_param)
    end

    it "routes to #destroy" do
      expect(delete("#{dinner_path}")).to route_to("dinner_events#destroy", :event_id => event.to_param)
    end

  end
end

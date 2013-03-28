require 'spec_helper'

describe "DinnerEvents" do
  login :admin
  
  describe "GET /event/N/dinner" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      dinner = FactoryGirl.create :dinner_event
      get event_dinner_path(dinner.event)
      response.status.should be(200)
    end
  end
end

require 'spec_helper'

describe "Judges" do
  login :admin

  describe "GET /event/judges" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      event = FactoryGirl.create :event
      get event_judges_path(event)
      response.status.should be(200)
    end
  end
end

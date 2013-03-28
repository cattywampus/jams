require 'spec_helper'

describe DinnerEvent do
  def valid_attributes
    FactoryGirl.attributes_for(:dinner_event).merge(event_id: FactoryGirl.create(:event).id)
  end

  it "should require venue" do
    no_venue = FactoryGirl.build :dinner_event, venue: ""
    no_venue.should_not be_valid
  end

  it "should require event_id" do
    no_event = FactoryGirl.build :dinner_event, event: nil
    no_event.should_not be_valid
  end
end

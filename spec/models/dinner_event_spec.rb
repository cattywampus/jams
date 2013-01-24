require 'spec_helper'

describe DinnerEvent do
  def valid_attributes
    FactoryGirl.attributes_for(:dinner_event).merge(event_id: FactoryGirl.create(:event).id)
  end

  it "should require venue" do
    no_venue = DinnerEvent.new valid_attributes.merge(venue: "")
    no_venue.should_not be_valid
  end

  it "should require event_id" do
    no_event = DinnerEvent.new valid_attributes.merge(event_id: nil)
    no_event.should_not be_valid
  end
end

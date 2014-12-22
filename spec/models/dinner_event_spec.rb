require 'rails_helper'

describe DinnerEvent do
  def valid_attributes
    FactoryGirl.attributes_for(:dinner_event).merge(event_id: FactoryGirl.create(:event).id)
  end

  it "should require venue" do
    no_venue = FactoryGirl.build :dinner_event, venue: ""
    expect(no_venue).not_to be_valid
  end

  it "should require event_id" do
    no_event = FactoryGirl.build :dinner_event, event: nil
    expect(no_event).not_to be_valid
  end
end

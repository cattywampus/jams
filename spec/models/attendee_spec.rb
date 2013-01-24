require 'spec_helper'

describe Attendee do
  it "should require a person" do
    no_person = Attendee.new dinner_event_id: 0
    no_person.should_not be_valid
  end

  it "should require a dinner event" do
    no_dinner = Attendee.new person_id: 0
    no_dinner.should_not be_valid
  end
end

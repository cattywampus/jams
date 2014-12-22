require 'rails_helper'

describe Attendee do
  it "should require a person" do
    no_person = Attendee.new dinner_event_id: 0
    expect(no_person).not_to be_valid
  end

  it "should require a dinner event" do
    no_dinner = Attendee.new person_id: 0
    expect(no_dinner).not_to be_valid
  end
end

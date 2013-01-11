require 'spec_helper'

describe Judge do

  def valid_attributes
    person = FactoryGirl.create(:person)
    event = FactoryGirl.create(:event)
    FactoryGirl.attributes_for(:judge).merge({person_id: person.id, event_id: event.id})
  end

  it "should require a person" do
    no_person = Judge.new valid_attributes.merge(person_id: nil)
    no_person.should_not be_valid
  end

  it "should require an event" do
    no_event = Judge.new valid_attributes.merge(event_id: nil)
    no_event.should_not be_valid
  end
end

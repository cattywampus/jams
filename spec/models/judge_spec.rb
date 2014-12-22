require 'rails_helper'

describe Judge do
  it { is_expected.to have_one :judge_assignment } 
  it { is_expected.to have_one :judge_team } 

  def valid_attributes
    person = FactoryGirl.create(:person)
    event = FactoryGirl.create(:event)
    FactoryGirl.attributes_for(:judge).merge({person_id: person.id, event_id: event.id})
  end

  it "should require a person" do
    no_person = Judge.new valid_attributes.merge(person_id: nil)
    expect(no_person).not_to be_valid
  end

  it "should require an event" do
    no_event = Judge.new valid_attributes.merge(event_id: nil)
    expect(no_event).not_to be_valid
  end
end

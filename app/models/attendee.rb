class Attendee < ActiveRecord::Base
  belongs_to :person
  belongs_to :dinner_event

  attr_accessible :dinner_event_id, :person_id

  validates_presence_of :dinner_event_id
  validates_presence_of :person_id
end

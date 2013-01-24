class DinnerEvent < ActiveRecord::Base
  belongs_to :event
  has_many :attendees
  has_many :people, through: :attendees
  
  attr_accessible :begins_at, :city, :ends_at, :event_id, :room, :state, :street1, :street2, :venue, :zip

  validates_presence_of :event_id
  validates_presence_of :venue
end

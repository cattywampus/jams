class DinnerEvent < ActiveRecord::Base
  belongs_to :event
  has_many :attendees
  has_many :people, through: :attendees
  has_many :entrees
  
  attr_accessible :begins_at, :city, :ends_at, :entrees_attributes, :room, :state, :street1, :street2, :venue, :zip

  accepts_nested_attributes_for :entrees

  validates_presence_of :event_id
  validates_presence_of :venue

  def missing_rsvp
    attending_ids = attendees.map { |a| a.person_id }
    event.judges.confirmed.where("person_id NOT IN (?)", attending_ids)
  end
end

class DinnerEvent < ApplicationRecord
  belongs_to :event
  has_many :attendees
  has_many :people, through: :attendees
  has_many :entrees

  accepts_nested_attributes_for :entrees

  validates_presence_of :event_id
  validates_presence_of :venue

  def missing_rsvp
    attending_ids = attendees.map { |a| a.person_id }
    attending_ids.present? ? event.judges.confirmed.where("person_id not in (?)", attending_ids) : event.judges.confirmed
  end
end

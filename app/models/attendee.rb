class Attendee < ActiveRecord::Base
  belongs_to :person
  belongs_to :dinner_event
  belongs_to :entree

  attr_accessible :dinner_event_id, :entree_id, :person_id, :status

  enum_attr :status, %w(attending declined)

  validates_presence_of :dinner_event_id
  validates_presence_of :person_id

  scope :attending, where({status: :attending})
  scope :declined, where({status: :declined})

  delegate :full_name, to: :person
  delegate :first_name, to: :person
  delegate :last_name, to: :person
  delegate :company, to: :person
end

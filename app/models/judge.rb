class Judge < ActiveRecord::Base
  belongs_to :person
  belongs_to :event

  attr_accessible :attending_dinner,
                  :biography, 
                  :completed_vims, 
                  :event_id,
                  :needs_shirt, 
                  :person_id,
                  :provided_conflict, 
                  :provided_consent, 
                  :received_event_info, 
                  :role, 
                  :rookie, 
                  :status

  enum_attr :status, %w(wait_list ^invited declined confirmed withdrew no_show)
  enum_attr :role, %w(^judge advisor assistant)

  validates_presence_of :person_id
  validates_presence_of :event_id
end

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

  scope :attending_dinner, where({attending_dinner: true})
  scope :confirmed, where({status: :confirmed})
  scope :judges, where({role: :judge})
  scope :advisors, where({role: :advisor})
  scope :assistants, where({role: :assistant})

  delegate :email, to: :person
  delegate :full_name, to: :person

  def self.to_csv(options={})
    CSV.generate(options) do |csv|
      csv << ["#", "Name", "Position", "Organization", "Email", "Status"]
      all.each_with_index do |judge, index|
        csv << [
          index + 1, 
          judge.person.full_name(true), 
          judge.person.position, 
          judge.person.company, 
          judge.person.email, 
          judge.status
        ]
      end
    end
  end
  
end

class Judge < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :person
  belongs_to :event
  has_one :judge_assignment
  has_one :judge_team, through: :judge_assignment

  enum_attr :status, %w(wait_list ^invited declined confirmed withdrew no_show)
  enum_attr :role, %w(^judge advisor assistant)

  validates_presence_of :person_id
  validates_presence_of :event_id

  scope :attending_dinner, -> { where({attending_dinner: true}) }
  scope :confirmed, -> { where({status: :confirmed}) }
  scope :judges, -> { where({role: :judge}) }
  scope :advisors, -> { where({role: :advisor}) }
  scope :assistants, -> { where({role: :assistant}) }
  scope :with_bio, -> { where("biography IS NOT NULL AND biography NOT IN ('', ' ')") }
  scope :without_bio, -> { where({biography: [nil, '', ' ']}) }

  delegate :email, to: :person
  delegate :full_name, to: :person
  delegate :first_name, to: :person
  delegate :last_name, to: :person
  delegate :company, to: :person

  def dinner_rsvp
    event.dinner.attendees.find_by_person_id(person_id) if event.dinner.present?
  end

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

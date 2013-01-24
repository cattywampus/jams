class Person < ActiveRecord::Base
  belongs_to :assistant, foreign_key: :assistant_id, class_name: "Person"
  has_many :attendees
  has_many :dinner_events, through: :attendees

  default_scope order("LOWER(first_name) ASC, LOWER(last_name) ASC")

  attr_accessible :assistant_id, 
                  :company, 
                  :email, 
                  :first_name, 
                  :gender, 
                  :last_name, 
                  :middle_name, 
                  :shirt_size, 
                  :title

  enum_attr :gender, %w(male female)
  enum_attr :shirt_size, %w(s m l xl xxl xxxl) do 
    label s: 'Small'
    label m: 'Medium'
    label l: 'Large'
    label xl: 'XL'
    label xxl: '2XL'
    label xxxl: '3XL'
  end

  validate :must_provide_full_name
  validates :email, presence: true, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i }

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def to_s
    full_name
  end
  
  private

  def must_provide_full_name
    fields = [:first_name, :last_name]
    errors.add_on_blank(fields)

    invalid = (errors.keys & fields).present?
    if invalid
      errors.add(:name, "is incomplete")
    end

    invalid
  end

end

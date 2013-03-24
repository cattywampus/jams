class Person < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :assistant, foreign_key: :assistant_id, class_name: "Person"
  has_many :addresses
  has_many :phone_numbers
  has_many :comments, as: :commentable
  has_many :judge_history, class_name: "Judge"
  has_many :attendees
  has_many :dinner_events, through: :attendees

  default_scope order("LOWER(first_name) ASC, LOWER(last_name) ASC")

  attr_accessible :addresses_attributes,
                  :assistant_id, 
                  :company, 
                  :email, 
                  :first_name, 
                  :gender, 
                  :last_name, 
                  :middle_name, 
                  :phone_numbers_attributes,
                  :position,
                  :shirt_size, 
                  :suffix,
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

  accepts_nested_attributes_for :addresses, 
                                :reject_if => proc { |a| a["street1"].blank? && a["city"].blank? && a["state"].blank? && a["zip"].blank? },
                                :allow_destroy => true
  accepts_nested_attributes_for :phone_numbers, :reject_if => :all_blank, :allow_destroy => true

  validate :must_provide_full_name
  validates :email, presence: true, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i }

  def self.suffixes 
    [
      "D.M.D.",
      "D.O.",
      "D.S.W.",
      "Eng.D.",
      "J.D.",
      "LL.D.",
      "M.D.",
      "O.D.",
      "Ph.D.",
      "Pharm.D."
    ]
  end

  def self.titles
    [
      "Mr.",
      "Mrs.",
      "Ms.",
      "Sir"
    ]
  end

  def full_name(formal=false)
    "#{first_name} #{last_name}#{', ' + suffix if formal && suffix.present?}"
  end

  def primary_email
    assistant.present? ? assistant.email : email
  end

  def shirt_size_label
    enums(:shirt_size).label(shirt_size)
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

class Person < ApplicationRecord
  has_paper_trail

  belongs_to :assistant, foreign_key: :assistant_id, class_name: "Person"
  has_many :addresses
  has_many :phone_numbers
  has_many :comments, as: :commentable
  has_many :judge_history, class_name: "Judge"
  has_many :attendees
  has_many :dinner_events, through: :attendees

  default_scope { order("LOWER(first_name) ASC, LOWER(last_name) ASC") }

  enum_attr :gender, %w(male female)
  enum_attr :shirt_size, %w(s m l xl 2xl 3xl 4xl) do
    label s: 'Small'
    label m: 'Medium'
    label l: 'Large'
    label xl: 'XL'
    label :'2xl' => '2XL'
    label :'3xl' => '3XL'
    label :'4xl' => '4XL'
  end

  mount_uploader :avatar, AvatarUploader

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

  def self.text_search(query)
    if query.present?
      where("first_name ilike :q or last_name ilike :q", q: "%#{query}%")
    else
      all
    end
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
    assistant.present? ? [email, assistant.email] : email
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
    errors.add(:first_name, :empty) if self.first_name.blank?
    errors.add(:last_name, :empty) if self.last_name.blank?

    invalid = (errors.keys & fields).present?
    if invalid
      errors.add(:name, "is incomplete")
    end

    invalid
  end

end

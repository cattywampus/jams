class PhoneNumber < ApplicationRecord
  belongs_to :person

  before_validation :clean_phone_number

  validates_presence_of :phone_number, if: lambda { |p| p.phone_type.present? || p.primary? }
  validates_presence_of :phone_type, if: lambda { |p| p.phone_number.present? || p.primary? }

  def self.types
    [
      "mobile",
      "home",
      "work",
      "iPhone",
      "main",
      "home fax",
      "work fax",
      "other fax",
      "pager",
      "other"
    ]
  end

private

  def clean_phone_number
    phone_number.gsub!(/[^0-9x+]/, '') if phone_number.present?
  end

end

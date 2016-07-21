class Address < ApplicationRecord
  belongs_to :person

  validate :must_provide_address, unless: lambda { |a| a.address_is_blank? }

  def self.types
    %w(home work other)
  end

  def address_is_blank?
    street1.blank? && city.blank? && state.blank? && zip.blank?
  end

private

  def must_provide_address
    if zip.present? || (city.present? && state.present?)
      false
    else
      errors.add(:address, "must include a city and state or zip code")
      errors.add_on_blank([:city, :state, :zip])
      true
    end
  end
end

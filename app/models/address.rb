class Address < ActiveRecord::Base
  belongs_to :person

  validate :must_provide_address, unless: lambda { |a| a.address_is_blank? }

  def self.types
    [
      "home",
      "work",
      "other"
    ]
  end

  def address_is_blank?
    street1.blank? && city.blank? && state.blank? && zip.blank?
  end

private

  def must_provide_address
    fields = [:street1, :city, :state, :zip]
    errors.add_on_blank(fields)

    (errors.keys & fields).present?
  end
end

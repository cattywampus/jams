class Event < ActiveRecord::Base
  belongs_to :game
  has_many :judges

  default_scope order("begins_on ASC")

  attr_accessible :begins_on, :city, :ends_on, :game_id, :logo, :name, :state, :street1, :street2, :venue, :zip

  mount_uploader :logo, LogoUploader
  
  validates_presence_of :name
  validates_presence_of :game_id

  def confirmed_judges
    judges.joins(:person).where({:status => :confirmed}).order("last_name ASC, first_name ASC")
  end

  def judges_without_shirts(gender)
    judges.joins(:person).where({needs_shirt: [true, nil], people: {gender: gender}})
  end

  def location
    if city.present? && state.present?
      "#{city}, #{state}"
    elsif state.present?
      state
    elsif city.present?
      city
    end
  end

  def shirts_needed(gender)
    shirtless = judges_without_shirts(gender).group(:shirt_size).count
    sizes = Person.new.enums(:shirt_size).hash
    sorted = ActiveSupport::OrderedHash.new
    sizes.each do |key, label|
      sorted[label] = shirtless[key.to_s]
      shirtless.delete(key.to_s)
    end

    sorted.merge(shirtless).map { |k,v| {size: k.nil? ? "Unknown" : k, count: v} }
  end

  def to_s
    name
  end
end

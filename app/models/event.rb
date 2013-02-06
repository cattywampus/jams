class Event < ActiveRecord::Base
  belongs_to :game
  has_many :judges

  attr_accessible :begins_on, :city, :ends_on, :game_id, :logo, :name, :state, :street1, :street2, :venue, :zip

  mount_uploader :logo, LogoUploader
  
  validates_presence_of :name
  validates_presence_of :game_id

  def confirmed_judges
    judges.joins(:person).where({:status => :confirmed}).order("last_name ASC, first_name ASC")
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

  def to_s
    name
  end
end

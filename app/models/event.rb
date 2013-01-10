class Event < ActiveRecord::Base
  belongs_to :game

  attr_accessible :begins_on, :city, :ends_on, :game_id, :logo, :name, :state, :street1, :street2, :venue, :zip

  mount_uploader :logo, LogoUploader
  
  validates_presence_of :name
  validates_presence_of :game_id
end

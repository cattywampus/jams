class Game < ActiveRecord::Base
  belongs_to :program
  
  attr_accessible :logo, :name, :program_id, :season

  mount_uploader :logo, LogoUploader

  validates_presence_of :name
  validates_presence_of :season
  validates_presence_of :program_id

  def to_s
    name
  end
end

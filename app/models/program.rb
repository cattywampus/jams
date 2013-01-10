class Program < ActiveRecord::Base
  has_many :games
  attr_accessible :abbr, :icon, :logo, :name

  mount_uploader :icon, LogoUploader
  mount_uploader :logo, LogoUploader

  validates_presence_of :name
  validates_presence_of :abbr

  def to_s
    name
  end
  
end

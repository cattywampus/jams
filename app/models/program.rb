class Program < ActiveRecord::Base
  attr_accessible :abbr, :icon, :logo, :name

  mount_uploader :icon, LogoUploader
  mount_uploader :logo, LogoUploader

  validates_presence_of :name
  validates_presence_of :abbr
end

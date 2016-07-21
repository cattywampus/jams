class Program < ApplicationRecord
  has_many :games

  mount_uploader :icon, LogoUploader
  mount_uploader :logo, LogoUploader

  validates_presence_of :name
  validates_presence_of :abbr

  def to_s
    name
  end

end

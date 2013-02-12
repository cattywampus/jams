class Game < ActiveRecord::Base
  belongs_to :program
  has_many :events, order: "begins_on ASC"
  
  attr_accessible :active, :logo, :name, :program_id, :season

  mount_uploader :logo, LogoUploader

  validates_presence_of :name
  validates_presence_of :season
  validates_presence_of :program_id

  scope :active, where({active: true})
  scope :inactive, where({active: [nil, false]})

  def to_s
    name
  end
end

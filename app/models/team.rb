class Team < ApplicationRecord
  resourcify

  ROLES = %w(member owner).freeze

  belongs_to :program

  mount_uploader :logo, LogoUploader
end

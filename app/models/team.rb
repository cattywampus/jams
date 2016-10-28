class Team < ApplicationRecord
  resourcify

  ROLES = %w(member owner).freeze

  mount_uploader :logo, LogoUploader
end

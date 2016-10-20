class Team < ApplicationRecord
  resourcify

  mount_uploader :logo, LogoUploader
end

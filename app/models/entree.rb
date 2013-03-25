class Entree < ActiveRecord::Base
  belongs_to :dinner_event
  attr_accessible :description, :name, :protein
end

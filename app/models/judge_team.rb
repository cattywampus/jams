class JudgeTeam < ActiveRecord::Base
  belongs_to :event
  has_many :judge_assignments

  validates :event, presence: true

  enum_attr :type, %w(machine team_attribute deans_list chairmans) 
end

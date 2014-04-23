class JudgeAssignment < ActiveRecord::Base
  belongs_to :judge
  belongs_to :judge_team
  
  validates :judge, presence: true
  validates :judge_team, presence: true
end

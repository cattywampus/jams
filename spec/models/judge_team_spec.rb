require 'spec_helper'

describe JudgeTeam do
  it { should belong_to :event }
  it { should have_many :judge_assignments } 

  it { should validate_presence_of :event }

end

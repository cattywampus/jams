require 'spec_helper'

describe JudgeAssignment do
  it { should belong_to :judge }
  it { should belong_to :judge_team }

  it { should validate_presence_of :judge }
  it { should validate_presence_of :judge_team }

end

require 'rails_helper'

describe JudgeAssignment do
  it { is_expected.to belong_to :judge }
  it { is_expected.to belong_to :judge_team }

  it { is_expected.to validate_presence_of :judge }
  it { is_expected.to validate_presence_of :judge_team }

end

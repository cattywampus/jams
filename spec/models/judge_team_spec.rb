require 'rails_helper'

describe JudgeTeam do
  it { is_expected.to belong_to :event }
  it { is_expected.to have_many :judge_assignments } 

  it { is_expected.to validate_presence_of :event }

end

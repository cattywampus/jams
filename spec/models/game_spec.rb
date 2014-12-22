require 'rails_helper'

describe Game do
  it "should require name" do
    no_name = build :game, name: ""
    expect(no_name).not_to be_valid
  end

  it "should require season" do
    no_season = build :game, season: ""
    expect(no_season).not_to be_valid
  end

  it "should require program association" do
    no_program = build :game, program: nil
    expect(no_program).not_to be_valid
  end
end

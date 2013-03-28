require 'spec_helper'

describe Game do
  it "should require name" do
    no_name = build :game, name: ""
    no_name.should_not be_valid
  end

  it "should require season" do
    no_season = build :game, season: ""
    no_season.should_not be_valid
  end

  it "should require program association" do
    no_program = build :game, program: nil
    no_program.should_not be_valid
  end
end

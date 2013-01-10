require 'spec_helper'

describe Game do
  def valid_attributes
    FactoryGirl.attributes_for(:game).merge(program_id: FactoryGirl.create(:program))
  end

  it "should require name" do
    no_name = Game.new valid_attributes.merge(name: "")
    no_name.should_not be_valid
  end

  it "should require season" do
    no_season = Game.new valid_attributes.merge(season: "")
    no_season.should_not be_valid
  end

  it "should require program association" do
    no_program = Game.new valid_attributes.merge(program_id: "")
    no_program.should_not be_valid
  end
end

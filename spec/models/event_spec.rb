require 'spec_helper'

describe Event do 
  let(:valid_attributes) { attributes_for(:event, game_id: create(:program).id) } 

  it { should have_many :judge_teams } 

  it "should require name" do
    no_name = Event.new valid_attributes.merge(name: "")
    no_name.should_not be_valid
  end

  it "should require game_id" do
    no_game = Event.new valid_attributes.merge(game_id: nil)
    no_game.should_not be_valid
  end
end

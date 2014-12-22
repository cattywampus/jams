require 'rails_helper'

describe Event do 
  let(:valid_attributes) { attributes_for(:event, game_id: create(:program).id) } 

  it { is_expected.to have_many :judge_teams } 

  it "should require name" do
    no_name = Event.new valid_attributes.merge(name: "")
    expect(no_name).not_to be_valid
  end

  it "should require game_id" do
    no_game = Event.new valid_attributes.merge(game_id: nil)
    expect(no_game).not_to be_valid
  end
end

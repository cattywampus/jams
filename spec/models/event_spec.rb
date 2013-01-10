require 'spec_helper'

describe Event do
  def valid_attributes
    FactoryGirl.attributes_for(:event).merge(game_id: FactoryGirl.create(:program).id)
  end

  it "should require name" do
    no_name = Event.new valid_attributes.merge(name: "")
    no_name.should_not be_valid
  end

  it "should require game_id" do
    no_game = Event.new valid_attributes.merge(game_id: nil)
    no_game.should_not be_valid
  end
end

require 'rails_helper'

describe Program do
  before (:each) do
    @attr = {
      :name => "FIRST Tech Challenge",
      :abbr => "FTC"
    }
  end

  it "should require name" do
    no_name = Program.new(@attr.merge(name: ""))
    expect(no_name).not_to be_valid
  end

  it "should require abbreviation" do
    no_abbr = Program.new(@attr.merge(abbr: ""))
    expect(no_abbr).not_to be_valid
  end
end

require 'spec_helper'

describe Program do
  before (:each) do
    @attr = {
      :name => "FIRST Tech Challenge",
      :abbr => "FTC"
    }
  end

  it "should require name" do
    no_name = Program.new(@attr.merge(name: ""))
    no_name.should_not be_valid
  end

  it "should require abbreviation" do
    no_abbr = Program.new(@attr.merge(abbr: ""))
    no_abbr.should_not be_valid
  end
end

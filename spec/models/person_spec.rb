require 'rails_helper'

describe Person do
  def valid_attributes
    FactoryGirl.attributes_for(:person) 
  end

  it "should require first name" do
    no_first_name = Person.new valid_attributes.merge(first_name: "")
    expect(no_first_name).not_to be_valid
  end

  it "should require last_name" do
    no_last_name = Person.new valid_attributes.merge(last_name: "")
    expect(no_last_name).not_to be_valid
  end

  it "should require email" do
    no_email = Person.new valid_attributes.merge(email: "")
    expect(no_email).not_to be_valid
  end

  it "should have valid email" do
    bad_email = Person.new valid_attributes.merge(email: "invalid email")
    bad_email = is_expected.not_to be_valid
  end
end

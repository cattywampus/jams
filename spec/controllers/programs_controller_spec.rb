require 'spec_helper'

describe ProgramsController do

  before (:each) do
    @program = FactoryGirl.create(:program)
  end

  describe "GET index" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET new" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new program" do
        expect {
          post :create, program: FactoryGirl.attributes_for(:program)
        }.to change(Program, :count).by(1)
      end

      it "redirects to the new program" do
        post :create, program: FactoryGirl.attributes_for(:program)
        response.should redirect_to Program.last
      end
    end

    context "with invalid attributes" do
      it "does not save a new program" do
        expect {
          post :create, program: FactoryGirl.attributes_for(:invalid_program)
        }.not_to change(Program, :count)
      end
      it "re-renders the new method" do
        post :create, program: FactoryGirl.attributes_for(:invalid_program)
        response.should render_template :new
      end
    end
  end

  describe "GET edit" do
    it "should be successful" do
      get 'edit', :id => @program.id
      response.should be_success
    end

    it "should find the right program" do
      get 'edit', :id => @program.id
      assigns(:program).should == @program
    end
  end

  describe "GET show" do
    it "should be successful" do
      get 'show', :id => @program.id
      response.should be_success
    end

    it "should find the right program" do
      get 'show', :id => @program.id
      assigns(:program).should == @program
    end
  end
end

require 'rails_helper'

describe ProgramsController do
  login :admin
  
  before (:each) do
    @program = FactoryGirl.create(:program)
  end

  describe "GET index" do
    it "should be successful for admins" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "should be successful" do
      get 'new'
      expect(response).to be_success
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
        expect(response).to redirect_to Program.last
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
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    it "should be successful" do
      get 'edit', :id => @program.id
      expect(response).to be_success
    end

    it "should find the right program" do
      get 'edit', :id => @program.id
      expect(assigns(:program)).to eq(@program)
    end
  end

  describe "GET show" do
    it "should be successful" do
      get 'show', :id => @program.id
      expect(response).to be_success
    end

    it "should find the right program" do
      get 'show', :id => @program.id
      expect(assigns(:program)).to eq(@program)
    end
  end
end

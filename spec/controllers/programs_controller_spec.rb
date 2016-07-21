require 'rails_helper'

describe ProgramsController do
  login :admin

  describe "GET index" do
    it "should be successful for admins" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "should be successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new program" do
        expect {
          post :create, params: { program: FactoryGirl.attributes_for(:program) }
        }.to change(Program, :count).by(1)
      end

      it "redirects to the new program" do
        post :create, params: { program: FactoryGirl.attributes_for(:program) }
        expect(response).to redirect_to Program.last
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_program) }

      it "does not save a new program" do
        expect {
          post :create, params: { program: invalid_attributes }
        }.not_to change(Program, :count)
      end

      it "re-renders the new method" do
        post :create, params: { program: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    let(:program) { FactoryGirl.create :program }

    it "should be successful" do
      get :edit, params: { :id => program.to_param }
      expect(response).to be_success
    end

    it "should find the right program" do
      get :edit, params: { :id => program.to_param }
      expect(assigns(:program)).to eq(program)
    end
  end

  describe "GET show" do
    let(:program) { FactoryGirl.create :program }

    it "should be successful" do
      get :show, params: { :id => program.to_param }
      expect(response).to be_success
    end

    it "should find the right program" do
      get :show, params: { :id => program.to_param }
      expect(assigns(:program)).to eq(program)
    end
  end
end

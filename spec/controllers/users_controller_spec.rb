require 'rails_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  before (:each) do
    sign_in user
  end

  describe "GET 'show'" do

    it "should be successful" do
      get :show, params: { :id => user.to_param }
      expect(response).to be_success
    end

    it "should find the right user" do
      get :show, params: { :id => user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end
end

module ControllerMacros
  def login(role)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = FactoryGirl.create(role)
      sign_in @current_user
    end
  end
end

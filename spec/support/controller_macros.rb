module ControllerMacros
  def login(role)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(role)
    end
  end
end

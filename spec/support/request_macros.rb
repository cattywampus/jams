module RequestMacros
  def login(role)
    before(:each) do
      user = FactoryGirl.create role
      post user_session_path, params: { 'user[email]' => user.email, 'user[password]' => user.password }
      follow_redirect!
    end
  end
end

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # raise request.env["omniauth.auth"].to_yaml
    token = request.env["omniauth.params"]["invitation_token"]
    user = User.from_omniauth(request.env["omniauth.auth"], token)

    if user.present?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      flash.alert = "Unable to sign in."
      redirect_to root_path
    end
  end

  alias_method :google_oauth2, :all
  alias_method :open_id, :all
end

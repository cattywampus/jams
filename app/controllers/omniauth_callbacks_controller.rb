class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all(auth, attributes={})
    user = User.from_omniauth(auth, attributes)
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def open_id
    auth = env["omniauth.auth"]
    attributes = {
      :name => auth.info.name,
      :email => auth.info.email
    }
    all(auth, attributes)
  end

end

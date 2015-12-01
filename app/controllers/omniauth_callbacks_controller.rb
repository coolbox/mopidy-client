class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    @user = User.find_or_create_by(
    	provider: auth_hash[:provider], 
    	uid: auth_hash[:uid]
    )

    @user.update_attributes(
    	email: auth_hash[:extra][:user_info][:user][:profile][:email] || "",
    	image: auth_hash[:extra][:user_info][:user][:profile][:image_192] || "",
    	first_name: auth_hash[:extra][:user_info][:user][:profile][:first_name] || "",
    	last_name: auth_hash[:extra][:user_info][:user][:profile][:last_name] || "",
    )

    sign_in_and_redirect @user, event: :authentication
  end

  def auth_hash
    request.env["omniauth.auth"]
  end
end
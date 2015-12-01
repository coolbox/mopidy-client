class SessionController < ApplicationController
  def index
    redirect_to player_path if current_user
  end

  def sign_out_user
    sign_out :user
    redirect_to root_path
  end 
end

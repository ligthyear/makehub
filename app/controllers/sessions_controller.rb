class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url, notice: 'Hallo!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Tschuus!'
  end
  
  private
    def auth_hash
      request.env["omniauth.auth"]
    end
end

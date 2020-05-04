class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
# https://b4b5c38637bf4caeb5ef69a18644cfcf.vfs.cloud9.ap-northeast-1.amazonaws.com/account_activations/$2a$12$G3WEO9PP5QnEmKjxIY..cuEAk3aEN/PcgWXyZ0rmNhN9bt86QJDOe/
# edit?email=michael%40michaelhartl.com
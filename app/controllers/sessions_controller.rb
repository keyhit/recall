class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    redirect_to users_url
    else
      redirect_to create_session_path
    end
  end
  
  def logout
    reset_session
    redirect_to users_url
  end
end

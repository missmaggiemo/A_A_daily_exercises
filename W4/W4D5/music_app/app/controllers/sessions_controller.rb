class SessionsController < ApplicationController
  
  # let user login with username or email? make the find agnostic?
  
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by_credentials(user_params)
    
    if user
      self.current_user = user
      redirect_to user_url(user)
    else
      flash.now[:errors] = "Username and/or password was incorrect!"
    end
  end
  
  def destroy
    logout_current_user!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end

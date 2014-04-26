class SessionsController < ApplicationController
  
  # let user login with username or email? make the find agnostic?
  
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by_credentials(user_params)
    
    if user && user.active?
      self.current_user = user
      redirect_to user_url(user)
    elsif user
      # you have an account, but you're not active!
      message = UserMailer.reactivate_email(user)
      message.deliver!
      redirect_to reactivate_thank_you_users_url
    else
      flash.now[:errors] = "Username and/or password was incorrect!"
    end
  end
  
  def destroy
    logout_current_user!
    session[:session_token] = nil
    redirect_to login_url
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end

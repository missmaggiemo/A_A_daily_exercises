class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    params[:user][:activate_token] = User.generate_activate_token
    @user = User.new(user_params)
    unless params[:user][:password] == params[:user][:password_confirmation]
      flash[:errors] = "Password and confirmation don't match!"
      render :new
    else
      if @user.save
        message = UserMailer.welcome_email(@user)
        message.deliver!
        redirect_to thank_you_users_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def deactivate
    @user = User.find(params[:id])
    @user.update(active: false)
    logout_current_user!
    redirect_to root_url
  end
  
  def reactivate
    @user = User.find(params[:id])
    @user.update(activate_token: User.generate_activate_token)
    message = UserMailer.welcome_email(@user)
    message.deliver!
    redirect_to user_url(@user)

# reset activation token and send user new confirmation email
  end
  
  def activate
    @user = User.find_by_token(id: params[:user_id], token: params[:token])
    @user.update(active: true)
    redirect_to user_url(@user)
  end
  
  def thank_you
  end
  
  def reactivate_thank_you
  end
  
  def index
    redirect_to user_url(current_user) unless current_user.admin?
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :activate_token)
  end
  
end

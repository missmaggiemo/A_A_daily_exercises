class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    unless params[:user][:password] == params[:user][:password_confirmation]
      flash[:errors] = "Password and confirmation don't match!"
      render :new
    else
      if @user.save
        message = UserMailer.welcome_email(@user)
        message.deliver!
        login(@user)
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
  
end

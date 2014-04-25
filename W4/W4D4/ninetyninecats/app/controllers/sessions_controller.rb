class SessionsController < ApplicationController
  before_action :user_signed_in?, only: [:new]

  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(user_params[:user_name], user_params[:password])
    if user.nil?
      @user = User.new(user_params)
      flash[:errors] ||= []
      flash.now[:errors] << "Username and/or password is incorrect"
      render :new
    else
      login_user!(user)
      redirect_to cats_url
    end
  end

  def destroy
    user = User.find(current_user.id)
    user_session = Session.find_by_token(session[:session_token])
    user_session.delete
    session[:session_token] = nil
    redirect_to cats_url
  end

  def show
    @user_sessions = Session.where("user_id = ?", current_user.id)
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def user_signed_in?
    redirect_to cats_url if current_user
  end

end

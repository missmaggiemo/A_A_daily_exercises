class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )

    if @user
      login_user!(@user)
      redirect_to feed_url
    else
      @user = User.new(user_params)
      flash.now[:errors] = ["Nice try, NSA!"]
      render :new
    end
  end

  def show

  end

  def destroy
    log_out!
    redirect_to root_url
  end

  def index
    render :json => User.all
  end

  def update

  end

  def edit

  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end

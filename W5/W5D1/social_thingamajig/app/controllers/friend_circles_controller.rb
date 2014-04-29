class FriendCirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :destroy]

  def new
    @circle = FriendCircle.new
    @user = current_user
  end

  def create
    @user = current_user
    # params[:friend_circle][:user_id] = @user.id
    @circle = @user.friend_circles.new(circle_params)
    if @circle.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    params[:friend_circle][:user_id] = @user.id
    if @circle && @circle.update(circle_params)
      redirect_to user_friend_circle_url(@user, @circle)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end




  private

  def circle_params
    params.require(:friend_circle).permit(:title, :user_id, :member_ids => [])
  end

  def set_circle
    @user = current_user
    @circle = FriendCircle.find(params[:id])
  end


end

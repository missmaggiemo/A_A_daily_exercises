class UsersController < ApplicationController

  def index
    # render :text => "I'm the index! Hear me roar!"
    @users = User.all
    render :json => @users.map { |user| user.as_json }
  end

  def show
    user = User.find(params[:id])
    render :json => user.as_json#{'first_key' => 'first_value'}
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params) if user
    render :json => user.as_json
  end

  def destroy
    user = User.find(params[:id])
    user.delete if user
    render :text => "You have deleted the user. Yay."
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def favorites
    user = User.find(params[:id])
    render :json => user.favorites.map { |contact| contact.as_json }
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :username)
    end

end

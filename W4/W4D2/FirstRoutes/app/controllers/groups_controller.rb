class GroupsController < ApplicationController

  def index
    # render :text => "I'm the index! Hear me roar!"
    @groups = Group.where(user_id: params[:user_id])
    render :json => @groups.map { |group| group.as_json }
  end

  def show
    group = Group.find(params[:id])
    render :json => group.as_json#{'first_key' => 'first_value'}
  end

  def destroy
    group = Group.find(params[:id])
    group.delete if group
    render :text => "You have deleted the group. Yay."
  end

  def create
    group = Group.new(group_params)
    if group.save
      render :json => group
    else
      render :json => group.errors.full_messages, :status => :unprocessable_entity
    end
  end

  private

    def group_params
      params.require(:group).permit(:name, :user_id)
    end

end

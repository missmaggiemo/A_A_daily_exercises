class ListsController < ApplicationController

  before_action :find_list, only: [:destroy, :show]

  def index
    @lists = List.all
    render json: @lists
  end


  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list
    else
      render json: @list.errors.full_messages, status: 422      
    end
  end
  
  def destroy
    if @list.try(:destroy)
      head :ok
      render json: {}
    else
      render json: @list.errors.full_messages, status: 422
    end
  end
  
  def show
    render json: @list, include: :lists
  end
  
  
  private
  
  def list_params
    params.require(:list).permit(:title, :board_id)
  end

  def find_list
    @list = List.find(params[:id])
  end


end

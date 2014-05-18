class ListsController < ApplicationController

  before_action :find_list, only: [:destroy, :show]

  def index
    @lists = List.all
    render json: @lists.sort_by(&:sort_id)
  end


  def create
    @list = List.new(list_params)
    if @list.save
      @list.update(sort_id: @list.id)
      render json: @list
    else
      render json: @list.errors.full_messages, status: 422      
    end
  end
  
  def destroy
    if @list.try(:destroy)
      head :ok
    else
      render json: @list.errors.full_messages, status: 422
    end
  end
  
  def show
    render json: @list, include: :cards
  end

  def update_order
    puts params
    if params[:list].length > 0
      @board = Board.find(params[:board_id])
      @board.lists.each.with_index do |list, index|
        puts params[:list][index]
        list.update(sort_id: params[:list][index])
      end
      head :ok
    else
      render json: "Oh no!", status: 422
    end
  end
  
  
  private
  
  def list_params
    params.require(:list).permit(:title, :board_id)
  end

  def find_list
    @list = List.find(params[:id])
  end

end

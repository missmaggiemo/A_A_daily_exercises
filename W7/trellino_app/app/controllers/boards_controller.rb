class BoardsController < ApplicationController

  before_action :find_board, only: [:destroy, :show]

  def index
    @boards = Board.all
    render json: @boards.sort_by(&:sort_id)
  end


  def create
    @board = Board.new(board_params)
    if @board.save
      @board.update(sort_id: @board.id)
      render json: @board
    else
      render json: @board.errors.full_messages, status: 422      
    end
  end
  
  def destroy
    if @board.try(:destroy)
      head :ok
    else
      render json: @board.errors.full_messages, status: 422
    end
  end
  
  def show
    render json: @board, include: { lists: { include: :cards } }
  end
  
  def update_order
    if update_order_params.length > 0
      Board.all.each.with_index do |board, index|
        board.update(sort_id: update_order_params[index])
      end
      head :ok
    else
      render json: "Oh no!", status: 422
    end
  end

  
  private
  
  def board_params
    params.require(:board).permit(:title, :description)
  end

  def find_board
    @board = Board.find(params[:id])
  end

  def update_order_params
    params.require(:board)
  end


end

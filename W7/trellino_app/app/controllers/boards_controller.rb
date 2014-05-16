class BoardsController < ApplicationController

  before_action :find_board, only: [:destroy, :show]

  def create
    @board = new Board(board_params)
    if @board.save
      render json: @board
    else
      render json: @board.errors.full_messages, status: 422      
    end
  end
  
  def destroy
    if @board.try(:destroy)
      head :ok
      render json: {}
    else
      render json: @board.errors.full_messages, status: 422
    end
  end
  
  def show
    render json: @board
  end
  
  
  private
  
  def board_params
    params.require(:board).permit(:title)
  end

  def find_board
    @board = Board.find(params[:id])
  end


end

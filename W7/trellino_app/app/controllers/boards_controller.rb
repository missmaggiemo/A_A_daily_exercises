class BoardsController < ApplicationController

  before_action :find_board, only: [:destroy, :show]

  def index
    @boards = Board.all
    render json: @boards
  end


  def create
    @board = Board.new(board_params)
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
    render json: @board, include: :lists
  end
  
  
  private
  
  def board_params
    params.require(:board).permit(:title, :description)
  end

  def find_board
    @board = Board.find(params[:id])
  end


end

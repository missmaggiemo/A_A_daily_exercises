class CardsController < ApplicationController

  before_action :find_card, only: [:destroy, :show]

  def index
    @cards = Card.all
    render json: @cards
  end


  def create
    @card = Card.new(card_params)
    if @card.save
      render json: @card
    else
      render json: @card.errors.full_messages, status: 422      
    end
  end
  
  def destroy
    if @card.try(:destroy)
      head :ok
      render json: {}
    else
      render json: @card.errors.full_messages, status: 422
    end
  end
  
  def show
    render json: @card, include: :cards
  end
  
  
  private
  
  def card_params
    params.require(:card).permit(:content, :list_id)
  end

  def find_card
    @card = Card.find(params[:id])
  end

end

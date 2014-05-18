class CardsController < ApplicationController

  before_action :find_card, only: [:destroy, :show]

  def index
    @cards = Card.all
    render json: @cards.sort_by(&:sort_id)
  end


  def create
    @card = Card.new(card_params)
    if @card.save
      @card.update(sort_id: @card.id)
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
  
  def update_order
    if params[:card].length > 0
      @list = List.find(params[:list_id])
      @list.cards.each.with_index do |card, index|
        card.update(sort_id: params[:card][index])
      end
      head :ok
    else
      render json: "Oh no!", status: 422
    end
  end
  
  private
  
  def card_params
    params.require(:card).permit(:content, :list_id)
  end

  def find_card
    @card = Card.find(params[:id])
  end

end

class CardsController < ApplicationController
  before_action :find_card, only: %i(show destroy)

  def index
    cards = Card.all
    render json: cards, status: :ok
  end

  def show
    render json: card, status: :ok
  end

  def create
    card = Card.new(card_params)
    if card.save
      render json: card, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :service_unavailable
    end
  end

  delegate :destroy, to: :card

  private

    def card_params
      params.permit(:name, :price, :status)
    end

    def find_card
      @card = Card.find(params[:id])
    end
end

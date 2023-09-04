class CardsController < ApplicationController
  include BCrypt
  before_action :find_card, only: %i(show activate cancel)

  def index
    cards = Card.all
    render json: cards, status: :ok
  end

  def show
    render json: card, status: :ok
  end

  def create
    activation_code = Password.create("#{@current_user.id}#{Time.zone.now}")
    card = Card.create(user_id: @current_user.id, status: Card.statuses[:needs_activation],
                       activation_code:, product_id: params[:product_id], name: params[:name])

    if card
      render json: card, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :service_unavailable
    end
  end

  def activate
    return render(json: { errors: "Card already activated" }) if @card.issued?

    if @card.activate_card(params.to_unsafe_h)
      render json: { message: "Activate successfully your card pin code is #{@card.pin_code}" }, status: :created
    else
      render json: { errors: "Invalid activation code" }, status: :unauthorized
    end

  end

  def cancel
    return render(json: { errors: "Card already cancelled" }) if @card.cancelled?

    card = @card.update(status: Card.statuses[:cancelled])
    CardAttempt.create(card_id: @card.id, status: Card.statuses[:cancelled], user_id: @current_user.id)

    if card
      render json: { message: "Success cancelling card" }, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :service_unavailable
    end
  end

  private

    def card_params
      params.permit(:name, :price, :balance, :product_id)
    end

    def find_card
      @card = Card.find(params[:id])
    end
end

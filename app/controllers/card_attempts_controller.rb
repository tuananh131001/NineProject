class CardAttemptsController < ApplicationController
  before_action :find_card, only: %i(show destroy)

  def issue
    card = Card.find(params[:id])
    user = User.find(params[:user_id])
    card_attempts = CardAttempt.create(user_id: user.id, card_id: card.id, status: CardAttempt.statuses[:issued])

    if card_attempts
      render json: card_attempts, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :service_unavailable
    end
  end

  def cancel
    attempt = CardAttempt.find(params[:id])
    status = attempt.update(status: CardAttempt.statuses[:cancelled])

    if status
      render json: attempt, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :service_unavailable
    end
  end
end

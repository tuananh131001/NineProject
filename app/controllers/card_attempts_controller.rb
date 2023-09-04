class CardAttemptsController < ApplicationController

  def index
    attempts = CardAttempt.order(created_at: :desc)

    if attempts
      render json: attempts, status: :ok
    else
      render json: { error: 'No attempts found' }, status: :not_found
    end
  end

end

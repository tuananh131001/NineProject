class Card < ApplicationRecord
  belongs_to :product
  has_many :card_attempts
  belongs_to :user

  enum status: {
    issued: 'issued',
    cancelled: 'cancelled',
    needs_activation: 'needs_activation'
  }

  def self.issued?
    status == status[:issued]
  end

  def self.cancelled?
    status == status[:issued]
  end

  def self.needs_activation?
    status == status[:issued]
  end

  def activate_card(card_params)
    card = Card.find_by(activation_code: card_params[:activation_code])
    if card
      pin_code = rand(1000..9999)
      card.update(status: Card.statuses[:issued], pin_code:)
      card
    else
      card.errors.full_messages
    end
  end
end

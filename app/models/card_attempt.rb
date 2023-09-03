class CardAttempt < ApplicationRecord
  belongs_to :card
  belongs_to :user

  enum status: {
    issued: 'issued',
    cancelled: 'cancelled'
  }

end
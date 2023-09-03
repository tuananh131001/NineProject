class Card < ApplicationRecord
  belongs_to :product
  has_one :card_attempts

end

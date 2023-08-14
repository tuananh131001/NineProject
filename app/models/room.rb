class Room < ApplicationRecord
  validates :name, uniqueness: true
  has_many :messages
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit { broadcast_append_to "rooms" }
end

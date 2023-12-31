# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :cards

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end

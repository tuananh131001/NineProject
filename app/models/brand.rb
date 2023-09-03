class Brand < ApplicationRecord
  has_many :products

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }
end

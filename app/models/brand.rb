class Brand < ApplicationRecord
  has_many :products
  validates :name, :rate, :headquarters, :industry, :founder, :website, :status, presence: true
  validates :name, uniqueness: true

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }, validation: { presence: true }
end

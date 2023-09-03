class Product < ApplicationRecord
  belongs_to :brand
  has_one :card

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  def self.create_with_brand(product_params)
    product = Product.new(product_params)
    if product.save
      product
    else
      product.errors.full_messages
    end
  end
end

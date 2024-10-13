class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :product

  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :product_id, presence: true
end

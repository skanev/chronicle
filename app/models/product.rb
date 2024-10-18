class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates :name, presence: true
  validates :calories, presence: true, numericality: {greater_than: 0}
  validates :unit, presence: true
  validates :units_per_kcal, presence: true, numericality: {greater_than: 0}
end

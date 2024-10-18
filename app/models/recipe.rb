class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, -> { order(:id) }

  validates :name, presence: true
end

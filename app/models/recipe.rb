class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, -> { order(:id) }

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, allow_destroy: true
end

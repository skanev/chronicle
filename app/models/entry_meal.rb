class EntryMeal < ApplicationRecord
  belongs_to :entry

  validates :name, presence: true
  validates :calories, presence: true, numericality: {greater_than: 0}
end

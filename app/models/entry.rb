class Entry < ApplicationRecord
  belongs_to :user
  has_many :meals, class_name: 'EntryMeal'

  validates :weight, numericality: {greater_than: 0, allow_nil: true}

  def to_param = date.to_formatted_s :db
  def calories = complete? ? meals.sum(&:calories) : nil
end

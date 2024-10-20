class CookedMeal < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :ingredients, class_name: 'CookedMealIngredient'

  accepts_nested_attributes_for :ingredients

  def total_calories
    ingredients.sum { _1.quantity * _1.calories / _1.units_per_kcal }.to_i
  end
end

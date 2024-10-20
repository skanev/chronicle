class CookedMealsController < ApplicationController
  def index
    @cooked_meals = current_user.cooked_meals
  end

  def show
    @cooked_meal = find_cooked_meal
  end

  def update
    cooked_meal = find_cooked_meal
    cooked_meal.update! cooked_meal_params
    render turbo_stream: turbo_stream.replace(:summary, partial: 'summary', locals: {cooked_meal:})
  end

  private

  def find_cooked_meal
    current_user.cooked_meals.find params[:id]
  end

  def cooked_meal_params
    params.require(:cooked_meal).permit(:cooked_on, :weight, ingredients_attributes: %i[id quantity calories])
  end
end

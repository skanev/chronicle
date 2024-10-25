class EntryMealsController < ApplicationController
  def create
    entry = current_user.entries.find_by_date! params[:entry_id]

    entry_meal = entry.meals.build meal_params

    if entry_meal.save
      render turbo_stream: [
        turbo_stream.replace(:new_entry_meal, partial: 'entry_meals/create', locals: {entry_meal: entry.meals.new}),
        turbo_stream.append(:entry_meals, entry_meal)
      ]
    else
      render turbo_stream: turbo_stream.replace(:new_entry_meal, partial: 'entry_meals/create', locals: {entry_meal:})
    end
  end

  def edit
    entry_meal = find_entry_meal

    render turbo_stream: turbo_stream.replace(entry_meal, partial: 'entry_meals/form', locals: {entry_meal:})
  end

  def update
    entry_meal = find_entry_meal

    if entry_meal.update meal_params
      render turbo_stream: turbo_stream.replace(entry_meal)
    else
      render turbo_stream: turbo_stream.replace(entry_meal, partial: 'entry_meals/form', locals: {entry_meal:})
    end
  end

  def destroy
    entry_meal = find_entry_meal
    entry_meal.destroy!
    render turbo_stream: turbo_stream.remove(entry_meal)
  end

  private

  def meal_params
    params.require(:entry_meal).permit(:name, :calories)
  end

  def find_entry_meal
    entry_meal = EntryMeal.find params[:id]
    raise unless entry_meal.entry.user == current_user
    entry_meal
  end
end

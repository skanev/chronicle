class IngredientsController < ApplicationController
  def create
    recipe = current_user.recipes.find params[:recipe_id]

    ingredient = recipe.ingredients.new ingredient_params

    if ingredient.save
      render turbo_stream: [
        turbo_stream.replace(:new_ingredient, partial: 'create', locals: {ingredient: recipe.ingredients.new}),
        turbo_stream.append(:ingredients, ingredient)
      ]
    else
      render turbo_stream: turbo_stream. replace(:new_ingredient, partial: 'create', locals: {ingredient:}),
             status: :unprocessable_entity
    end
  end

  def edit
    ingredient = find_ingredient

    render turbo_stream: turbo_stream.replace(ingredient, partial: 'form', locals: {ingredient:})
  end

  def update
    products = Current.user.products
    ingredient = find_ingredient

    if ingredient.update ingredient_params
      render turbo_stream: turbo_stream.replace(ingredient)
    else
      render turbo_stream: turbo_stream.replace(ingredient, partial: 'form', locals: {ingredient:}),
             status: :unprocessable_entity
    end
  end

  def destroy
    ingredient = find_ingredient

    ingredient.destroy!

    render turbo_stream: turbo_stream.remove(ingredient)
  end

  private

  def ingredient_params
    params.expect ingredient: %i[product_id quantity]
  end

  def find_ingredient
    ingredient = Ingredient.find params[:id]

    # TODO: Come back to this and make it nicer
    raise unless Current.user.id == ingredient.recipe.user_id

    ingredient
  end
end

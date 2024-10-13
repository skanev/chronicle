class IngredientsController < ApplicationController
  def create
    recipe = Current.user.recipes.find params[:recipe_id]
    ingredient = recipe.ingredients.new ingredient_params
    products = Current.user.products

    if ingredient.save
      render turbo_stream: [
        turbo_stream.replace('new-ingredient', partial: 'ingredients/new_ingredient', locals: {new_ingredient: recipe.ingredients.new, products:}),
        turbo_stream.append('ingredients', partial: 'ingredients/ingredient', locals: {ingredient:, products:})
      ]
    else
      render turbo_stream: turbo_stream.
        replace('new-ingredient', partial: 'ingredients/new_ingredient', locals: {new_ingredient: ingredient, products:}),
        status: :unprocessable_entity
    end
  end

  def update
    products = Current.user.products
    ingredient = find_ingredient

    if ingredient.update ingredient_params
      render turbo_stream: [
        turbo_stream.replace(ingredient, partial: 'ingredients/ingredient', locals: {ingredient:, products:}),
      ]
    else
      render turbo_stream: [
        turbo_stream.replace(ingredient, partial: 'ingredients/ingredient', locals: {ingredient:, products:}),
      ], status: :unprocessable_entity
    end
  end

  def destroy
    ingredient = find_ingredient

    ingredient.destroy!

    render turbo_stream: turbo_stream.remove(ingredient)
  end

  private

  def ingredient_params
    params.expect(ingredient: [:product_id, :quantity])
  end

  def find_ingredient
    ingredient = Ingredient.find params[:id]

    # TODO: Come back to this and make it nicer
    raise unless Current.user.id == ingredient.recipe.user_id

    ingredient
  end
end

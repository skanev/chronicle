class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = current_user.recipes.includes(ingredients: :product).find params[:id]
  end
end

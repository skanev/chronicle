class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build recipe_params

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe = current_user.recipes.includes(ingredients: :product).find params[:id]
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :source_url, :instructions)
  end
end

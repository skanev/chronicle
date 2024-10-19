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
      redirect_to @recipe, notice: 'Recipe created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe = find_recipe
  end

  def edit
    @recipe = find_recipe
  end

  def update
    @recipe = find_recipe

    if @recipe.update recipe_params
      redirect_to @recipe, notice: 'Recipe updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit_ingredients
    recipe = find_recipe

    render turbo_stream: turbo_stream.replace(:recipe_ingredients, partial: 'edit_ingredients', locals: {recipe:})
  end

  def list_ingredients
    recipe = find_recipe

    render turbo_stream: turbo_stream.replace(:recipe_ingredients, partial: 'ingredients', locals: {recipe:})
  end

  private

  def find_recipe
    current_user.recipes.includes(ingredients: :product).find params[:id]
  end

  def recipe_params
    params.require(:recipe).permit(:name, :source_url, :instructions, ingredients_attributes: [:id, :product_id, :quantity])
  end
end

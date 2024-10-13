class RecipesController < ApplicationController
  def index
    @recipes = Current.user.recipes
  end

  def show
    @recipe = Current.user.recipes.find params[:id]
    @products = Current.user.products
  end
end

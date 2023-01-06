class ShoppingListsController < ApplicationController
  def index
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipefoods = @recipe.recipefoods.includes([:food])
    @total = sum(@recipefoods)
  end

  def create
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipefoods = @recipe.recipefoods.includes([:food])
    @total = sum(@recipefoods)
  end

  def sum(recipefoods)
    total = 0
    recipefoods.each do |rf_food|
      total += rf_food.food.price * rf_food.quantity.to_i
    end
    total
  end
end

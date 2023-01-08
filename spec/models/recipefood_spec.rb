require 'rails_helper'

RSpec.describe Recipefood, type: :model do
  before(:each) do
    @user = User.create(name: 'Angel', email: 'test@test.com', password: '123456')
    @food = Food.create(user: @user, name: 'Dustwich', quantity: 1, price: 70, measurement_unit: 'g')
    @recipe = Recipe.create(user: @user, name: 'dust', preparation_time: 90, cooking_time: 40,
                            description: 'Edible dust particles', public: true)
    @recipefood = @recipe.recipefoods.create(quantity: 4, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'is only valid with a recipe_id and user_id' do
    expect(@recipefood).to be_valid
  end

  it 'it is not valid without food id' do
    @recipefood.food_id = nil
    expect(@recipefood).not_to be_valid
  end

  it 'quantity found of 1 or greater than that' do
    @recipefood.quantity = 1
    expect(@recipefood).to be_valid
  end

  it 'it is not valid without recipe id' do
    @recipefood.recipe_id = nil
    expect(@recipefood).not_to be_valid
  end
end

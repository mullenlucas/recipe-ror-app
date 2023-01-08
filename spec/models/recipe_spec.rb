require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Nuk', email: 'nuk@email.com', password: 'lalala')
    @user.save
    @food = Food.create(user: @user, name: 'Dustwich', quantity: 1, price: 70, measurement_unit: 'g')
    @recipe = Recipe.create(user: @user, name: 'dust', preparation_time: 90, cooking_time: 40,
                            description: 'Edible dust particles', public: true)
  end

  it 'is created succesfully' do
    expect(@recipe).to be_valid
  end

  it 'Name is required' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not created successfully when missing user id' do
    @recipe.user = nil
    expect(@recipe).to_not be_valid
  end
end

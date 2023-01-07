require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Nuk Tashino', email: 'nuk@tashino.com', password: 'lalala')
    @food = Food.create(user: @user, name: 'Dustwich', price: 70, measurement_unit: 'g')
  end

  it 'is succesfully created' do
    expect(@food).to be_valid
  end

  it 'is not succesfully created when missing a user' do
    @food.user = nil
    expect(@food).not_to be_valid
  end

  it 'is not succesfully created when missing food name' do
    @food.name = nil
    expect(@food).not_to be_valid
  end

  it 'is not succesfully created when missing price' do
    @food.price = nil
    expect(@food).not_to be_valid
  end

  it 'is not created succesfully without a price' do
    @food.measurement_unit = ''
    expect(@food).not_to be_valid
  end

  it 'is not possible to add a repeated ingredient/food name' do
    @food1 = Food.create(user: @user, name: 'Dustwich', price: 70, measurement_unit: 'g')
    expect(@food1).not_to be_valid
  end
end

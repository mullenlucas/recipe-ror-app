require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Nuk', email: 'nuk@email.com', password: 'lalala')
    @user.save
  end

  it 'is created succesfully' do
    expect(@user).to be_valid
  end

  it 'name is not necessarily required' do
    expect(@user).to be_valid
    @user.name = nil
    expect(@user).to be_valid
  end

  it 'is not valid without email' do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it 'is not valid without password' do
    @user.password = ''
    expect(@user).not_to be_valid
  end
end

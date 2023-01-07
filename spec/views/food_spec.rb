require 'rails_helper'

RSpec.describe 'Rendering foods page', type: :feature do
  describe 'Testing signup page' do
    before :each do
      visit user_session_path
      @user = User.new(name: 'Nuk Tashino', email: 'nuk@tashino.com', password: 'lalala')
      @user.save!
      visit foods_path
      @food_list = Food.create(name: 'Makena', measurement_unit: 'g', price: 60)
    end

    feature 'Testing food index page' do
      background { visit foods_path }

      scenario 'It should display app title' do
        expect(page).to have_content('Candent')
      end
      scenario 'It should display Recipe' do
        expect(page).to have_content('Recipe')
      end
    end
  end
end

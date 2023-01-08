require 'rails_helper'

RSpec.describe 'PublicRecipe', type: :feature do
  describe 'index page' do
    before :each do
      @nice_recipe = Recipe.create(name: 'Nice recipe', preparation_time: '1,5 hours', cooking_time: '40',
                                   description: 'Tasty dustwich', public: true)
    end

    feature 'Testing post index page' do
      background { visit public_recipes_path }

      scenario 'I can see the title' do
        expect(page).to have_content('Recipe')
      end

      scenario 'I can see the app title' do
        expect(page).to have_content('Candent')
      end

      scenario 'I can see the sign out button' do
        expect(page).to have_content('Sign')
      end
    end
  end
end

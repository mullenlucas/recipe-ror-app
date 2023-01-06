Rails.application.routes.draw do
  resources :shopping_lists
  resources :shopping_lists
  get 'public_recipes/index'
  devise_for :users

  root 'public_recipes#index'
  resources :users do
    resources :foods, only: %i[index new create]
    resources :recipes, only: %i[index show new create destroy] do
      resources :recipefoods, only: %i[new create destroy]
    end
  end

  resources :public_recipes, only: %i[index]
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create edit update destroy]
  resources :shopping_lists, only: %i[create]
  
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipefoods, only: %i[new create destroy update edit]
    resources :shopping_lists, only: %i[index show create]
  end
end
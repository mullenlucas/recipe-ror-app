Rails.application.routes.draw do
  # resources :shopping_lists
  # get 'public_recipes/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_up' => 'devise/registrations#create'
  end
  # Defines the root path route ("/")
  root 'users#index'
  resources :users do
    resources :foods, only: %i[index new create]
    resources :recipes, only: %i[index show new create destroy] do
      resources :recipefoods, only: %i[new create destroy]
    end
  end

  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create edit update destroy]
  
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipefoods, only: %i[new create destroy update edit]
  end
end
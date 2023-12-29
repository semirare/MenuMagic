Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "ingredients#index"
end

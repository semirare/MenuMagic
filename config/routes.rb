# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, { defaults: { format: :json } } do
    namespace :v1 do
      resources :recipes, only: %i[index show create update destroy]
    end
  end
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients
  resources :plannings do
    resources :planning_recipes, on: :member
  end

  root "recipes#index"
end

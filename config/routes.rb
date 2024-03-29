# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients
  resources :plannings do
    resources :planning_recipes, on: :member
  end

  root "recipes#index"
end

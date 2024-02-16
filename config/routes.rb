# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients

  get "planning/index", to: "planning#index", as: "planning"

  root "ingredients#index"
end

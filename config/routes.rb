# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients
  resources :plannings do
    get "grocery_list", on: :member
  end

  root "ingredients#index"
end

# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_and_belongs_to_many :planning_recipes, dependent: :destroy
  has_and_belongs_to_many :plannings, through: :planning_recipes

  accepts_nested_attributes_for :recipe_ingredients
end

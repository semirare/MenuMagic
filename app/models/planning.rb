class Planning < ApplicationRecord
  has_many :planning_recipes
  has_many :recipes, through: :planning_recipes
end

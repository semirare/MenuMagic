class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  scope :not_in_recipe, -> (recipe_id) {
    where.not(id: RecipeIngredient.select(:ingredient_id).where(recipe_id: recipe_id))
  }

  validates :name, presence: true
end

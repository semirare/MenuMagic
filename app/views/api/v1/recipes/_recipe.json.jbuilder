# frozen_string_literal: true

json.id recipe.id
json.name recipe.name
json.created_at recipe.created_at
json.updated_at recipe.updated_at
json.ingredients do
  json.array! recipe.recipe_ingredients, partial: "api/v1/recipe_ingredients/recipe_ingredient", as: :recipe_ingredient
end

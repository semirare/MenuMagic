# frozen_string_literal: true

json.recipe do
  json.id recipe.id
  json.name recipe.name
  json.created_at recipe.created_at
  json.updated_at recipe.updated_at
  json.recipe_ingredients do
    recipe.recipe_ingredients.each do |recipe_ingredient|
      json.id recipe_ingredient.id
      json.ingredient_id recipe_ingredient.ingredient_id
      json.amount recipe_ingredient.amount
      json.unit recipe_ingredient.unit
      json.created_at recipe_ingredient.created_at
      json.updated_at recipe_ingredient.updated_at
    end
  end
end

# frozen_string_literal: true

json.recipes do
  json.array! @recipes, partial: "api/v1/recipes/recipe", as: :recipe
end

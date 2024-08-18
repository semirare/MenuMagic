# frozen_string_literal: true

json.recipe do
  json.partial! "api/v1/recipes/recipe", recipe: @recipe
end

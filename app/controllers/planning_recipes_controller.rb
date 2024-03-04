# frozen_string_literal: true

class PlanningRecipesController < ApplicationController

  def update
    @planning = Planning.find(params[:planning_id])
    old_recipe = PlanningRecipe.find(params[:id])
    replace_id = old_recipe.recipe.id
    plan_recipes = @planning.recipes.pluck(:id)
    new_recipe = Recipe.where.not(id: plan_recipes).sample
    if old_recipe.update(recipe_id: new_recipe.id)
      render turbo_stream: turbo_stream.replace("recipe_card_recipe_#{replace_id}",
                                                partial: 'plannings/recipe_card',
                                                locals: { recipe: new_recipe })
    else
      redirect_back fallback_location: root_path, flash: { error: 'There was a problem re-rolling your recipe' }
    end
  end
end

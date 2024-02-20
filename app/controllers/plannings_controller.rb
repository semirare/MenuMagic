# frozen_string_literal: true

class PlanningsController < ApplicationController
  def new
    @recipes = Recipe.all.sample(7)
    @planning = Planning.new
    @recipes.each do |recipe|
      @planning.recipes << recipe
    end
  end

  def create
    @planning = Planning.new(planning_params)

    respond_to do |format|
      if @planning.save
        format.html { redirect_to grocery_list_planning_path(@planning) }
        format.json { render json: @planning }
      else
        format.html { render :new, status: :unprocessable_entity, errors: @planning.errors }
        format.json { render json: @planning.errors }
      end
    end
  end

  def grocery_list
    @planning = Planning.find(params[:id])
    @ingredients = @planning.recipes.includes(:ingredients).map(&:recipe_ingredients).flatten.group_by(&:ingredient_id)
                            .map do |ingredient_id, recipe_ingredients|
      quantity = recipe_ingredients.map(&:quantity).compact.sum # Remove nil values before summing
      ingredient = Ingredient.find(ingredient_id)
      unit_id = recipe_ingredients.first&.ingredient_unit_id
      unit = unit_id ? IngredientUnit.find(unit_id).name : "N/A" # Fetch unit from IngredientUnits table if unit_id is present
      {
        name: ingredient.name,
        quantity:,
        unit:
      }
    end
  end

  private

  def planning_params
    params.require(:planning).permit(recipe_ids: [])
  end
end

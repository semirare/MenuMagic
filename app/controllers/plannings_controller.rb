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
      {
        name: Ingredient.find(ingredient_id).name,
        quantity: recipe_ingredients.map(&:quantity).compact.sum,
        unit: get_ingredient_unit(recipe_ingredients)
      }
    end
  end

  private

  def planning_params
    params.require(:planning).permit(recipe_ids: [])
  end

  def get_ingredient_unit(recipe_ingredients)
    unit_id = nil
    recipe_ingredients.each do |recipe_ingredient|
      if recipe_ingredient.ingredient_unit_id.present?
        unit_id = recipe_ingredient.ingredient_unit_id
        break # Break the loop as soon as a unit_id is found
      end
    end
    unit_id ? IngredientUnit.find(unit_id).name : "N/A"
  end
end

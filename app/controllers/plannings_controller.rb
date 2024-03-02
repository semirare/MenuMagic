# frozen_string_literal: true

class PlanningsController < ApplicationController

  def create
    @recipes = Recipe.includes(recipe_ingredients: :ingredient_unit).all.sample(7)
    @planning = Planning.new
    @recipes.each do |recipe|
      @planning.recipes << recipe
    end

    respond_to do |format|
      if @planning.save
        format.html { redirect_to planning_path(@planning) }
        format.json { render json: @planning }
      else
        format.html { redirect_to root_path, notice: { error: "There was an error creating your plan. Please try again."} }
        format.json { render json: @planning.errors }
      end
    end
  end

  def show
    @planning = Planning.find(params[:id])
  end

  def grocery_list
    @planning = Planning.find(params[:id])
    @ingredients = @planning.recipes.includes(:ingredients).map(&:recipe_ingredients).flatten.group_by(&:ingredient_id)
                            .map do |ingredient_id, recipe_ingredients|
      {
        name: Ingredient.find(ingredient_id).name,
        quantity: convert_to_base_unit(recipe_ingredients),
        unit: get_ingredient_unit(recipe_ingredients)
      }
    end
  end

  def reroll
    @planning = Planning.new(planning_params.except(:reroll_id))
    old_recipe = @planning.planning_recipes.find_by(recipe_id: planning_params[:reroll_id])
    new_recipe = Recipe.sample
    if old_recipe.update(recipe_id: new_recipe.id)
      render turbo_stream: turbo_stream.replace("recipe_card_#{old_recipe.recipe_id}", 'recipe_card',
                                                locals: { recipe: new_recipe })
    else
      redirect_back fallback_location: plannings_path, flash: { error: 'There was a problem rerolling your recipe' }
    end
  end

  private

  def planning_params
    params.require(:planning).permit(:reroll_id, recipe_ids: [])
  end

  def convert_to_base_unit(recipe_ingredients)
    total_quantity = 0
    recipe_ingredients.each do |recipe_ingredient|
      if recipe_ingredient.ingredient_unit.present?
        total_quantity += recipe_ingredient.quantity / recipe_ingredient.ingredient_unit.base_conversion
      end
    end
    total_quantity
  end

  def get_ingredient_unit(recipe_ingredients)
    unit = nil
    recipe_ingredients.each do |recipe_ingredient|
      if recipe_ingredient.ingredient_unit.present?
        unit = IngredientUnit.find_by(type: recipe_ingredient.ingredient_unit.type, base_conversion: 1).name
        break # Break the loop as soon as a unit type is found
      end
    end
    unit || "N/A"
  end
end

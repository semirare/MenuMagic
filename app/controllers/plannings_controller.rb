# frozen_string_literal: true

class PlanningsController < ApplicationController
  before_action :set_planning, except: %i[ create ]

  def create
    @recipes = Recipe.includes(recipe_ingredients: :ingredient_unit).all.sample(7)
    @planning = Planning.new
    @recipes.each do |recipe|
      @planning.recipes << recipe
    end

    respond_to do |format|
      if @planning.save
        format.html { redirect_to edit_planning_path(@planning) }
        format.json { render json: @planning }
      else
        format.html { redirect_to root_path, notice: { error: "There was an error creating your plan. Please try again." } }
        format.json { render json: @planning.errors }
      end
    end
  end

  def edit; end

  def show
    @ingredients = @planning.recipes.includes(:ingredients).map(&:recipe_ingredients).flatten.group_by(&:ingredient_id)
                            .map do |ingredient_id, recipe_ingredients|
      readable_ingredient = convert_to_readable_unit(recipe_ingredients)
      {
        name: Ingredient.find(ingredient_id).name,
        quantity: readable_ingredient[:quantity],
        unit: readable_ingredient[:unit]
      }
    end
  end

  private

  def set_planning
    @planning = Planning.find(params[:id])
  end

  def planning_params
    params.require(:planning).permit(recipe_ids: [])
  end

  def convert_to_base_unit(recipe_ingredients)
    total_quantity = 0
    recipe_ingredients.each do |recipe_ingredient|
      if recipe_ingredient.ingredient_unit.present?
        total_quantity += (recipe_ingredient.quantity * recipe_ingredient.ingredient_unit.base_conversion)
      end
    end

    total_quantity
  end

  def convert_to_readable_unit(recipe_ingredients)
    total_quantity = convert_to_base_unit(recipe_ingredients)
    return { quantity: total_quantity, unit: 'N/A' } unless recipe_ingredients.first.ingredient_unit.present?

    type = recipe_ingredients.first.ingredient_unit.type
    options = IngredientUnit.where(type:).order(base_conversion: :desc)
    options.each do |option|
      if total_quantity > option.base_conversion
        return { quantity: (total_quantity / option.base_conversion).round(2), unit: option.name }
      end
    end

    { quantity: total_quantity, unit: 'N/A' }
  end

end
# frozen_string_literal: true

class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: %i[update destroy]

  # POST /recipe_ingredients or /recipe_ingredients.json
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to edit_recipe_path(@recipe_ingredient.recipe) }
        format.turbo_stream { render_create_turbo }
        format.json { render :show, status: :created, location: @recipe_ingredient.recipe }
      else
        format.html do
          redirect_back fallback_location: recipes_path,
                        alert: "There was an error saving the recipe ingredient.",
                        status: :unprocessable_entity
        end
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    puts params
    respond_to do |format|
      if @recipe_ingredient.update(recipe_ingredient_params)
        format.html
      else
        format.html do
          redirect_back fallback_location: recipes_path,
                        alert: "There was an error saving the recipe ingredient.",
                        status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /recipe_ingredients/1 or /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe_ingredient.recipe) }
      format.turbo_stream { render_delete_turbo }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :quantity, :ingredient_unit_id)
  end

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def render_create_turbo
    render turbo_stream: [
      turbo_stream.append("included_ingredients_turbo_frame", partial: "recipes/ingredient_form",
                                                              locals: { recipe_ingredient: @recipe_ingredient }),
      turbo_stream.remove("unused_ingredient_#{@recipe_ingredient.ingredient_id}")
    ]
  end

  def render_delete_turbo
    render turbo_stream: [
      turbo_stream.append("unused_ingredients", partial: "recipes/unused_ingredient",
                                                locals: { ingredient: @recipe_ingredient.ingredient,
                                                          recipe_id: @recipe_ingredient.recipe_id }),
      turbo_stream.remove(@recipe_ingredient)
    ]
  end
end

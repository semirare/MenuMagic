# frozen_string_literal: true

class Api::V1::RecipesController < Api::V1::ApiController
  before_action :set_recipe, only: %i[show update destroy]

  def index
    @recipes = Recipe.all.order(name: :asc)
  end

  def show; end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.json { render :show, status: :created, location: @recipe }
      else
        format.json { render_error(:unprocessable_entity, @recipe.errors) }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.json { render_error(:unprocessable_entity, @recipe.errors) }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end

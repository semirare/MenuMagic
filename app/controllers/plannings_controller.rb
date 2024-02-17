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
    puts(planning_params)
    @planning = Planning.new(planning_params)

    respond_to do |format|
      if @planning.save
        format.html { redirect_to root_path }
        format.json { render json: @planning }
      else
        format.html { render :new, status: :unprocessable_entity, errors: @planning.errors }
        format.json { render json: @planning.errors }
      end
    end
  end

  private

  def planning_params
    params.require(:planning).permit(recipe_ids: [])
  end
end

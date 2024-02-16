class PlanningController < ApplicationController
  def index
    @recipes = Recipe.all.sample(7)
  end
end

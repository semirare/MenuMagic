# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/planning_recipes", type: :request do
  let(:planning) { create(:planning) }

  before(:each) do
    create_list(:planning_recipe, 7, planning_id: planning.id)
    create(:recipe)
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested recipe_ingredient" do
        planning_recipe = planning.planning_recipes.first
        old_ids = planning.recipes.pluck(:id)
        patch planning_planning_recipe_path(planning, planning_recipe)
        planning_recipe.reload
        assert old_ids.exclude?(planning_recipe.recipe.id)
        assert planning_recipe.planning.id == planning.id
      end

      it "replace the recipe card with a new one" do
        planning_recipe = planning.planning_recipes.first
        patch planning_planning_recipe_path(planning, planning_recipe)
        planning_recipe.reload
        expect(response).to be_successful
        expect(response.media_type).media_type
      end
    end
  end
end

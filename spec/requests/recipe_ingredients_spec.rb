# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/recipe_ingredients", type: :request do
  let(:recipe) { create(:recipe) }

  let(:valid_attributes) do
    {
      recipe_id: recipe.id,
      ingredient_id: create(:ingredient).id,
      quantity: 1,
      ingredient_unit_id: create(:ingredient_unit).id
    }
  end

  let(:invalid_attributes) do
    {
      recipe_id: nil,
      ingredient_id: nil
    }
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RecipeIngredient" do
        recipe
        expect do
          post recipe_ingredients_url, params: { recipe_ingredient: valid_attributes }
        end.to change(RecipeIngredient, :count).by(1)
      end

      it "redirects to the recipe" do
        post recipe_ingredients_url, params: { recipe_ingredient: valid_attributes }
        expect(response).to redirect_to(edit_recipe_path(RecipeIngredient.last.recipe))
      end
    end

    context "with invalid parameters" do
      it "does not create a new RecipeIngredient" do
        expect do
          post recipe_ingredients_url, params: { recipe_ingredient: invalid_attributes }
        end.to change(RecipeIngredient, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post recipe_ingredients_url, params: { recipe_ingredient: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  xdescribe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          quantity: 2,
          ingredient_unit_id: create(:ingredient_unit).id
        }
      end

      it "updates the requested recipe_ingredient" do
        recipe_ingredient = RecipeIngredient.create! valid_attributes2684
        patch recipe_ingredient_url(recipe_ingredient), params: { recipe_ingredient: new_attributes }
        recipe_ingredient.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the recipe_ingredient" do
        recipe_ingredient = RecipeIngredient.create! valid_attributes
        patch recipe_ingredient_url(recipe_ingredient), params: { recipe_ingredient: new_attributes }
        recipe_ingredient.reload
        expect(response).to redirect_to(recipe_ingredient_url(recipe_ingredient))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        recipe_ingredient = RecipeIngredient.create! valid_attributes
        patch recipe_ingredient_url(recipe_ingredient), params: { recipe_ingredient: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested recipe_ingredient" do
      recipe_ingredient = RecipeIngredient.create! valid_attributes
      expect do
        delete recipe_ingredient_url(recipe_ingredient)
      end.to change(RecipeIngredient, :count).by(-1)
    end

    it "redirects to the recipe" do
      recipe_ingredient = RecipeIngredient.create! valid_attributes
      delete recipe_ingredient_url(recipe_ingredient)
      expect(response).to redirect_to(recipe_path(recipe_ingredient.recipe))
    end
  end
end

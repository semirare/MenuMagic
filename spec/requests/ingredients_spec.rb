# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/ingredients", type: :request do
  let(:valid_attributes) do
    {
      name: "eggs"
    }
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ingredient" do
        expect do
          post ingredients_url, params: { ingredient: valid_attributes }
        end.to change(Ingredient, :count).by(1)
      end

      it "redirects to the ingredients index" do
        post ingredients_url, params: { ingredient: valid_attributes }
        expect(response).to redirect_to(ingredients_path)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ingredient" do
      ingredient = Ingredient.create! valid_attributes
      expect do
        delete ingredient_url(ingredient)
      end.to change(Ingredient, :count).by(-1)
    end

    it "redirects to the ingredients list" do
      ingredient = Ingredient.create! valid_attributes
      delete ingredient_url(ingredient)
      expect(response).to redirect_to(ingredients_url)
    end
  end
end

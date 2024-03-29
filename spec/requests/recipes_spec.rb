# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/recipes", type: :request do
  let(:valid_attributes) do
    {
      name: "MyString"
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Recipe.create! valid_attributes
      get recipes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      recipe = Recipe.create! valid_attributes
      get recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_recipe_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      recipe = Recipe.create! valid_attributes
      get edit_recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Recipe" do
        expect do
          post recipes_url, params: { recipe: valid_attributes }
        end.to change(Recipe, :count).by(1)
      end

      it "redirects to the created recipe" do
        post recipes_url, params: { recipe: valid_attributes }
        expect(response).to redirect_to(recipes_path)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested recipe" do
        recipe = Recipe.create! valid_attributes
        patch recipe_url(recipe), params: { recipe: new_attributes }
        recipe.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the recipe" do
        recipe = Recipe.create! valid_attributes
        patch recipe_url(recipe), params: { recipe: new_attributes }
        recipe.reload
        expect(response).to redirect_to(recipe_url(recipe))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested recipe" do
      recipe = Recipe.create! valid_attributes
      expect do
        delete recipe_url(recipe)
      end.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipes list" do
      recipe = Recipe.create! valid_attributes
      delete recipe_url(recipe)
      expect(response).to redirect_to(recipes_url)
    end
  end
end

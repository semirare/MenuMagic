# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/ingredients", type: :request do
  let(:valid_attributes) do
    {
      name: "MyString"
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Ingredient.create! valid_attributes
      get ingredients_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ingredient_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      ingredient = Ingredient.create! valid_attributes
      get edit_ingredient_url(ingredient)
      expect(response).to be_successful
    end
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

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          name: "MyString2"
        }
      end

      it "updates the requested ingredient" do
        ingredient = Ingredient.create! valid_attributes
        patch ingredient_url(ingredient), params: { ingredient: new_attributes }
        ingredient.reload
        expect(ingredient.name).to eq("MyString2")
      end

      it "redirects to the ingredient" do
        ingredient = Ingredient.create! valid_attributes
        patch ingredient_url(ingredient), params: { ingredient: new_attributes }
        ingredient.reload
        expect(response).to redirect_to(ingredient_url(ingredient))
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

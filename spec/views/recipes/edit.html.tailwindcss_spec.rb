# frozen_string_literal: true

require "rails_helper"

RSpec.describe "recipes/edit.html.erb", type: :view do
  let(:recipe) { create(:recipe) }
  let(:ingredients_not_in_recipe) { create_list(:ingredient, 3) }

  before do
    assign(:recipe, recipe)
    assign(:ingredients_not_in_recipe, ingredients_not_in_recipe)
    render
  end

  it "renders the recipe edit form" do
    expect(rendered).to have_selector("form[action='#{recipe_path(recipe)}'][method='post']")
    expect(rendered).to have_field("recipe[name]", with: recipe.name)
  end

  it "renders the included ingredients" do
    expect(rendered).to have_selector("div#used_ingredients")
    recipe.recipe_ingredients.each do |recipe_ingredient|
      expect(rendered).to have_selector("div#used_ingredients", text: recipe_ingredient.ingredient.name)
    end
  end

  it "renders the unused ingredients" do
    expect(rendered).to have_selector("div#unused_ingredients")
    ingredients_not_in_recipe.each do |ingredient|
      expect(rendered).to have_selector("div#unused_ingredients", text: ingredient.name)
    end
  end

  it "renders the ingredient form for adding new ingredients" do
    expect(rendered).to have_selector("input[name='ingredient[name]'][type='text']")
    expect(rendered).to have_selector("button[type='submit'] i.fa-plus.text-green-500")
  end

  it "renders the form errors if any" do
    recipe.errors.add(:name, "can't be blank")
    assign(:recipe, recipe)
    render
    expect(rendered).to have_selector("#error_explanation")
    expect(rendered).to have_selector("ul li", text: "Name can't be blank")
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe "recipe_ingredients/show", type: :view do
  before(:each) do
    assign(:recipe_ingredient, RecipeIngredient.create!(
                                 recipe: nil,
                                 ingredient: nil
                               ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

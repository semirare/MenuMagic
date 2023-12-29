require 'rails_helper'

RSpec.describe "recipe_ingredients/edit", type: :view do
  let(:recipe_ingredient) {
    RecipeIngredient.create!(
      recipe: nil,
      ingredient: nil
    )
  }

  before(:each) do
    assign(:recipe_ingredient, recipe_ingredient)
  end

  it "renders the edit recipe_ingredient form" do
    render

    assert_select "form[action=?][method=?]", recipe_ingredient_path(recipe_ingredient), "post" do

      assert_select "input[name=?]", "recipe_ingredient[recipe_id]"

      assert_select "input[name=?]", "recipe_ingredient[ingredient_id]"
    end
  end
end

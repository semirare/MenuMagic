require 'rails_helper'

RSpec.describe "recipe_ingredients/new", type: :view do
  before(:each) do
    assign(:recipe_ingredient, RecipeIngredient.new(
      recipe: nil,
      ingredient: nil
    ))
  end

  it "renders new recipe_ingredient form" do
    render

    assert_select "form[action=?][method=?]", recipe_ingredients_path, "post" do

      assert_select "input[name=?]", "recipe_ingredient[recipe_id]"

      assert_select "input[name=?]", "recipe_ingredient[ingredient_id]"
    end
  end
end

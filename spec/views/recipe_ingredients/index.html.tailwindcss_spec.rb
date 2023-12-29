require 'rails_helper'

RSpec.describe "recipe_ingredients/index", type: :view do
  before(:each) do
    assign(:recipe_ingredients, [
      RecipeIngredient.create!(
        recipe: nil,
        ingredient: nil
      ),
      RecipeIngredient.create!(
        recipe: nil,
        ingredient: nil
      )
    ])
  end

  it "renders a list of recipe_ingredients" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end

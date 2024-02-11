# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ingredients/edit", type: :view do
  let(:ingredient) do
    Ingredient.create!(
      name: "MyString"
    )
  end

  before(:each) do
    assign(:ingredient, ingredient)
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredient_path(ingredient), "post" do
      assert_select "input[name=?]", "ingredient[name]"
    end
  end
end

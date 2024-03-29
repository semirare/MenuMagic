# frozen_string_literal: true

require "rails_helper"

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
             Recipe.create!(
               name: "Name"
             ),
             Recipe.create!(
               name: "Name"
             )
           ])
  end

  it "renders a list of recipes" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end

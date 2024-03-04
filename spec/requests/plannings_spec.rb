require 'rails_helper'

RSpec.describe "Plannings", type: :request do
  let(:planning) { create(:planning) }

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_planning_path(planning)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get planning_path(planning)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "renders a successful response" do
      create_list(:recipe, 8)
      post plannings_path
      expect(response).to redirect_to(edit_planning_path(Planning.last))
      expect(Planning.last.recipes.length).to eq(7)
    end
  end
end

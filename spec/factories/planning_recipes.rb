FactoryBot.define do
  factory :planning_recipe do
    planning { create(:planning) }
    recipe { create(:recipe) }
  end
end

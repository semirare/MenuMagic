# frozen_string_literal: true

# spec/factories/recipes.rb

require "faker"

FactoryBot.define do
  factory :ingredient_unit do
    name { Faker::Food.measurement }
    type { IngredientUnit.types.keys.sample }
  end
end

# frozen_string_literal: true

# spec/factories/recipes.rb

require "faker"

FactoryBot.define do
  factory :ingredient_unit do
    name { Faker::Food.measurement }
    type { [0, 1, 2].sample(1).first }
  end
end

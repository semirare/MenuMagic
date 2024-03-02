# frozen_string_literal: true

# spec/factories/recipes.rb

require "faker"

FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    ingredients { create_list(:ingredient, rand(9) + 1)}
  end
end

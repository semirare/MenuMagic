# frozen_string_literal: true

# spec/factories/recipes.rb

require "faker"

FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
  end
end

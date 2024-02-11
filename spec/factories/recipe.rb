# frozen_string_literal: true

# spec/factories/recipes.rb

require "faker"

FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
  end
end

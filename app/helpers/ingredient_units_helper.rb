# frozen_string_literal: true

module IngredientUnitsHelper
  def fraction_to_float(fraction)
    return nil if fraction.blank?

    if fraction.include?("/")
      parts = fraction.split("/")
      numerator = parts[0].to_f
      denominator = parts[1].to_f
      numerator / denominator
    else
      fraction.to_f
    end
  end
end

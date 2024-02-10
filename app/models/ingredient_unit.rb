class IngredientUnit < ApplicationRecord
    self.inheritance_column = :_type_disabled
    has_many :recipe_ingredients

    enum type: { weight: 0, volume: 1, other: 2 }
end

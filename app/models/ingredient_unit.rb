class IngredientUnit < ApplicationRecord
    self.inheritance_column = :_type_disabled

    enum type: { weight: 0, volume: 1, other: 2 }
end

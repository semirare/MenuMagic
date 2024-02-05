class IngredientUnit < ApplicationRecord
    enum type: { weight: 0, volume: 1, other: 2 }
end

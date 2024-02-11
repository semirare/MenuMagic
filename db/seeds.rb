# frozen_string_literal: true

# { weight: 0, volume: 1, other: 2 }
IngredientUnit.create([{ name: "mL", type: 1 }, { name: "L", type: 1 }, { name: "tsp", type: 1 },
                       { name: "tbsp", type: 1 }, { name: "fl. oz", type: 1 }, { name: "cup", type: 1 },
                       { name: "pt", type: 1 }, { name: "qt", type: 1 }, { name: "gal", type: 1 },
                       { name: "mg", type: 0 }, { name: "g", type: 0 }, { name: "kg", type: 0 },
                       { name: "oz", type: 0 }, { name: "lb", type: 0 }, { name: "can", type: 2 }])

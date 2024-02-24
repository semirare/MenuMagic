# frozen_string_literal: true

# {type: weight: 0, volume: 1, other: 2 }
IngredientUnit.create([{ name: "mL", type: 1, base_conversion: 1 },
                       { name: "L", type: 1, base_conversion: 1000 },
                       { name: "tsp", type: 1, base_conversion: 4.929 },
                       { name: "tbsp", type: 1, base_conversion: 14.787 },
                       { name: "fl. oz", type: 1, base_conversion: 29.574 },
                       { name: "cup", type: 1, base_conversion: 240 },
                       { name: "pt", type: 1, base_conversion: 473.176 },
                       { name: "qt", type: 1, base_conversion: 946.353 },
                       { name: "gal", type: 1, base_conversion: 3785.41 },
                       { name: "mg", type: 0, base_conversion: 1 },
                       { name: "g", type: 0, base_conversion: 1000 },
                       { name: "kg", type: 0, base_conversion: 1_000_000 },
                       { name: "oz", type: 0, base_conversion: 28_349.5 },
                       { name: "lb", type: 0, base_conversion: 453_592 },
                       { name: "can", type: 2, base_conversion: 1 }])

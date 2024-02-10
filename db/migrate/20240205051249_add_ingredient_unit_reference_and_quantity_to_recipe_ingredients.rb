class AddIngredientUnitReferenceAndQuantityToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_ingredients, :ingredient_unit, null: true, foreign_key: true
    add_column :recipe_ingredients, :quantity, :float, null: true
  end
end

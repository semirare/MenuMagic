class AddIngredientUnitReferenceToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :ingredient_unit, null: true, foreign_key: true
  end
end

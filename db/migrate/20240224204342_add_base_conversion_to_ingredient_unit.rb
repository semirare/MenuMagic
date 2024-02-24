class AddBaseConversionToIngredientUnit < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredient_units, :base_conversion, :float
  end
end

# frozen_string_literal: true

class CreateIngredientUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_units do |t|
      t.string :name
      t.integer :type

      t.timestamps
    end

    add_index :ingredient_units, :type
  end
end

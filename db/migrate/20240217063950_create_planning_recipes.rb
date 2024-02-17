class CreatePlanningRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :planning_recipes do |t|
      t.integer :planning_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end

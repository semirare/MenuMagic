class PlanningRecipe < ApplicationRecord
  belongs_to :planning
  belongs_to :recipe
end

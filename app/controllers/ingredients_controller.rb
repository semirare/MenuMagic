# frozen_string_literal: true

class IngredientsController < ApplicationController
  # POST /ingredients or /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params.except(:recipe_id))

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_url, notice: "Ingredient was successfully created." }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("unused_ingredients_turbo_frame", partial: "unused_ingredients",
                                                                                     locals: { ingredient: @ingredient,
                                                                                               recipe: Recipe.find(params[:recipe_id]) })
        end
        format.json { render :index, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end
end

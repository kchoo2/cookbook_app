class Api::RecipesController < ApplicationController

  def one_recipe_action
    @recipe = Recipe.first
    render "one_recipe.json.jbuilder"
  end

end

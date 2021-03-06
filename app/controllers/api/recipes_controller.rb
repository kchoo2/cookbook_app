class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    search_term = params[:search]
    if search_term
      @recipes = @recipes.where(
                              "title iLIKE ? OR directions iLIKE ? OR ingredients iLIKE ?", 
                              "%#{search_term}%", 
                              "%#{search_term}%",
                              "%#{search_term}%"
                              )
    end

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    if sort_attribute && sort_order
      @recipes = @recipes.order(sort_attribute => sort_order)
    elsif sort_attribute
      @recipes = @recipes.order(sort_attribute)

    end

    render 'index.json.jbuilder'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                        title: params[:title],
                        user_id: params[:user_id],
                        prep_time: params[:prep_time],
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )
    @recipe.save

    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    
    @recipe.save

    render 'show.json.jbuilder'
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    render json: {message: "Poof!"}
  end
end

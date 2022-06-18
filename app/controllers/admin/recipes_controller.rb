class Admin::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to admin_recipe_path(@recipe.id)
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to admin_recipe_path(@recipe.id)
  end
  
  private
  
  def recipe_params
    params.permit(:name, :material, :explanation, :time, :genre, :image)
  end
end

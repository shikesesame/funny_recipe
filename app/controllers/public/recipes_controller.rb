class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @newrecipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to public_recipes_path
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to public_recipe_path(@recipe.id)
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to public_recipes_path
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :material, :explanation, :time, :genre, :image, :customer_id)
  end
end

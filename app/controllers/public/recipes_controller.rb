class Public::RecipesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :material, :explanation, :time, :genre, :image, :customer_id)
  end
end

class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
    @customer = current_customer
  end

  def show
    @recipe = Recipe.find(params[:id])
    @customer = @recipe.customer
    @recipes = @customer.recipes
    @newrecipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.customer == current_customer
      render "edit"
    else
      redirect_to public_recipe_path(@recipe.id)
    end
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.customer_id = current_customer.id
    if @recipe.save
      flash[:notice] = "レシピは正常に作成されました"
      redirect_to public_recipe_path(@recipe.id)
    else
      @recipes = Recipe.all
      @customer = current_customer
      render "index"
    end
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.customer_id = current_customer.id
    if @recipe.update(recipe_params)
      flash[:notice] = "正常に更新されました"
      redirect_to public_recipe_path(@recipe.id)
    else
      render "edit"
    end
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

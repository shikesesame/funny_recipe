class Public::RecipeCommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = current_customer.recipe_comments.new(recipe_comment_params)
        @comment.recipe_id = @recipe.id
        @comment.save
        redirect_to public_recipe_path(@recipe.id)
    end
    
    def destroy
        RecipeComment.find(params[:id]).destroy
        redirect_to public_recipe_path(params[:recipe_id])
    end
    
    private
    
    def recipe_comment_params
        params.require(:recipe_comment).permit(:comment)
    end
end

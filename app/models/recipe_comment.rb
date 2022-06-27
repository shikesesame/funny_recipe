class RecipeComment < ApplicationRecord
    #アソシエーション
    belongs_to :customer
    belongs_to :recipe
    
end

class AddCustomerIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :customer_id, :integer
  end
end

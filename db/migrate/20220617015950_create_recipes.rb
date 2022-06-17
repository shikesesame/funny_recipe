class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      
      t.string :name
      t.text :material
      t.text :explanation
      t.integer :time
      t.string :genre

      t.timestamps
    end
  end
end

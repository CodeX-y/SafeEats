class RemoveVegearianFromIngredients < ActiveRecord::Migration[7.1]
  def change
    remove_column :ingredients, :vegetarian, :boolean
  end
end

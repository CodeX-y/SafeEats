class RemoveVeganFromIngredients < ActiveRecord::Migration[7.1]
  def change
    remove_column :ingredients, :vegan, :boolean
  end
end

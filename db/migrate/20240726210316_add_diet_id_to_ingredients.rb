class AddDietIdToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredient, :diet_id, :integer
  end
end

class AddDietidToIngredient < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :diet_id, :integer
  end
end

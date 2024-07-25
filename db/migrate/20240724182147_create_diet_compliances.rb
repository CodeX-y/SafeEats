class CreateDietCompliances < ActiveRecord::Migration[7.1]
  def change
    create_table :diet_compliances do |t|
      t.integer :ingredient_id
      t.integer :diet_id

      t.timestamps
    end
  end
end

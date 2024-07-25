class CreateUserDiets < ActiveRecord::Migration[7.1]
  def change
    create_table :user_diets do |t|
      t.integer :user_id
      t.integer :diet_id

      t.timestamps
    end
  end
end

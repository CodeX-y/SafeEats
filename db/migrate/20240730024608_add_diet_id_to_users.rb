class AddDietIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :diet_id, :integer
  end
end

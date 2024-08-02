class ChangeDefaultDietIdOnUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :diet_id, :integer, :default => nil
  end
end

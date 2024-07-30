class RemoveUserIdFromDietCompliances < ActiveRecord::Migration[7.1]
  def change
    remove_column :diet_compliances, :user_id, :integer
  end
end

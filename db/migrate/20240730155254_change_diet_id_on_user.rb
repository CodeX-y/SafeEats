class ChangeDietIdDefaultOnUser < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :diet_id, nil
  end
end

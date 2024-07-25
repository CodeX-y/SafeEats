class AddUserIdToDietCompliance < ActiveRecord::Migration[7.1]
  def change
    add_column :diet_compliances, :user_id, :integer
  end
end

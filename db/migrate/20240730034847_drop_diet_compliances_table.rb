class DropDietCompliancesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :diet_compliances
  end
end

class FixNamesInOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :first_name_id, :integer
    remove_column :orders, :last_name_id, :integer
    add_column :orders, :orderer_first_name, :string
    add_column :orders, :orderer_last_name, :string
  end
end

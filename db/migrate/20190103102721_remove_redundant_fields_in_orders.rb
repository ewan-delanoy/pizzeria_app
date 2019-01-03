class RemoveRedundantFieldsInOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :orderer_first_name, :string
    remove_column :orders, :orderer_last_name, :string
  end
end

class AddAdminIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :admin_id, :integer
  end
end

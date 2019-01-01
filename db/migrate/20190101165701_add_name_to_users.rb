class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :orders, :first_name_id, :integer
    add_column :orders, :last_name_id, :integer
  end
end

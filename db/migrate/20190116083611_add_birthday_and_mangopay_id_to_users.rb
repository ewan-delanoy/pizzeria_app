class AddBirthdayAndMangopayIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :mangopay_user_id, :integer
  end
end

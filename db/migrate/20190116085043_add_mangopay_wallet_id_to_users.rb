class AddMangopayWalletIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mangopay_wallet_id, :integer
  end
end

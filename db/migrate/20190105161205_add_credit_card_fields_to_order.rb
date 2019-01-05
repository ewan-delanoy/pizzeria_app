class AddCreditCardFieldsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :card_number, :string
    add_column :orders, :card_cvv, :string
    add_column :orders, :card_expires, :string
    add_column :orders, :card_expires_month, :string
    add_column :orders, :card_expires_year, :string
  end
end

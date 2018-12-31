class AddRecipeFieldToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :recipe, :string
  end
end

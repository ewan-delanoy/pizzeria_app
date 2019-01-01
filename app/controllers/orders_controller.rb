class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.state = "Reçue"
    @order.user_id = 1
    @order.admin_id = 1
    @order.save
    redirect_to order_path(@order)
  end
  private
  def order_params
    params.require(:order).permit(:recipe)
  end
end

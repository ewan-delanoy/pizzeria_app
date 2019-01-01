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
    if @order.save
      flash[:notice] = "Order was successfully placed"
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end
  def show
    @order = Order.find(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:recipe)
  end
end

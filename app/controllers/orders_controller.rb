class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.state = "Reçue"
    @order.user_id = 1
    @order.admin_id = 1
    @order.orderer_first_name="Peggy"
    @order.orderer_last_name="Lee"
    @order.save
    if @order.save
      flash[:notice] = "Votre commande a bien été reçue."
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end
  def show
    @order = Order.find(params[:id])
  end
  def show
    @order = Order.find(params[:id])
  end
  def edit
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    some_params = params.require(:order).permit(:state)
    if @order.update(some_params)
      flash[:notice] = "La commande a bien été mise à jour."
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end
  private
  def order_params
    params.require(:order).permit(:recipe)
  end
end

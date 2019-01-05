class OrdersController < ApplicationController
  before_action :set_usual_order, only: [:show, :edit, :update]
  before_action :require_logged, only: [:index, :new, :create, :show]
  before_action :require_admin, only: [:edit, :update]
  def index
    @orders = Order.paginate(page: params[:order_page], per_page: 4)
  end
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.state = "Reçue"
    @order.user= current_user
    @order.admin_id = 1
    @order.save
    if @order.save
      flash[:success] = "Votre commande a bien été reçue."
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end
  def show
  end
  def edit
  end
  def update
    some_params = params.require(:order).permit(:state)
    if @order.update(some_params)
      flash[:success] = "La commande a bien été mise à jour."
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end
  private
  def set_usual_order
    @order = Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:recipe)
  end
end

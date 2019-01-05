class UsersController < ApplicationController
  before_action :require_admin, only: [:index]
  before_action :require_same_user_or_admin, only: [:show]
  def index
    @users = User.paginate(page: params[:user_page], per_page: 4)
  end
  def show
    @user = User.find(params[:id])
    @user_orders = @user.orders.paginate(page: params[:order_page], per_page: 4)
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bienvenue à notre Pizzeria #{@user.first_name} #{@user.last_name}"
      redirect_to root_path
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  def require_same_user_or_admin
    if !admin_logged_in?
      if current_user != @user
        flash[:danger] = "Vous ne pouvez pas visualiser les coordonnées des autres utilisateurs"
        redirect_to root_path
      end
    end
  end
end

class UsersController < ApplicationController
  before_action :require_admin, only: [:index]
  def index
    @users = User.paginate(page: params[:user_page], per_page: 4)
  end
  def show
    @user = User.find(params[:id])
    @user_orders = @user.orders.paginate(page: params[:order_page], per_page: 4)
    if (!admin_logged_in?)&&(current_user != @user)
      puts "AAA"
      p current_user
      puts "BBB"
      p @user
      puts "CCC"
      flash[:danger] = "Vous ne pouvez pas visualiser les coordonnées des autres utilisateurs"
      redirect_to root_path
    end
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
end

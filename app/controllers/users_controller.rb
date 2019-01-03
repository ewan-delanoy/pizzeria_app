class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @orders = Order.all
    @user = User.find(params[:id])
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

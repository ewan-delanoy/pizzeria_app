class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @orders = Order.all 
    @user = User.find(params[:id])
  end
end

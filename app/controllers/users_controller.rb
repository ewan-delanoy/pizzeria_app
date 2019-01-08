class UsersController < ApplicationController
  before_action :require_admin, only: [:index]
  def index
    @users = User.paginate(page: params[:user_page], per_page: 4)
  end
  def show
    @user = User.find(params[:id])
    @user_orders = @user.orders.paginate(page: params[:order_page], per_page: 4)
    if (!admin_logged_in?)&&(current_user != @user)
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
      TrainMailer.registration_confirmation_email(@user).deliver
      flash[:success] = "Veuillez confirmer votre email pour continuer"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Bravo! Votre email est bien confirmé. Connectez-vous pour continuer."
      redirect_to root_path
    else
      flash[:error] = "Désolé. Cet utilisateur n'existe pas."
      redirect_to root_path
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end

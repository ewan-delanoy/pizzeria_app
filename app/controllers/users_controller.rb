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
    compacted_date = @user.birthday.to_i
    mangopay_user= MangoPay::NaturalUser.create({
      "FirstName"=>@user.first_name,
      "LastName"=>@user.last_name,
      "Nationality"=>"fr",
      "CountryOfResidence"=>"fr",
      "Email"=>@user.email,
      "Birthday"=>compacted_date
    })
    mangopay_wallet= MangoPay::Wallet.create({
      "Owners" => [mangopay_user['Id']],
      "Description" => "Pizza buyer's wallet",
      "Currency" => "EUR"
    })
    @user.mangopay_user_id = mangopay_user['Id']
    @user.mangopay_wallet_id = mangopay_wallet['Id']
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
      session[:user_id] = user.id
      flash[:success] = "Bravo ! Votre inscription est confirmée et vous êtes maintenant connecté(e)."
      redirect_to user_path(user)
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

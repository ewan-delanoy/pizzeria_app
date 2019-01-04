class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Vous êtes maintenant connecté(e)."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Les données que vous venez d'entrer sont incorrectes en tout ou en partie."
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "Vous êtes maintenant déconnecté(e)."
    redirect_to root_path
  end

end

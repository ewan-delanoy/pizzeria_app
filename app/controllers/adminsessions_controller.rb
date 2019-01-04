class AdminsessionsController < ApplicationController
  def new
  end
  def create
    admin = Admin.find_by(name: params[:session][:name])
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      flash[:success] = "Vous êtes maintenant connecté(e) en mode administrateur."
      redirect_to welcome_admin_path
    else
      flash.now[:danger] = "Les données que vous venez d'entrer sont incorrectes en tout ou en partie."
      render 'new'
    end
  end
  def destroy
    session[:admin_id] = nil
    flash[:success] = "Vous êtes maintenant déconnecté(e) du mode administrateur."
    redirect_to root_path
  end

end

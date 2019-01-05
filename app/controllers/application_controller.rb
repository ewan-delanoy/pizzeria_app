class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin, :admin_logged_in?, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def user_logged_in?
    !!current_user
  end
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  def admin_logged_in?
    !!current_admin
  end
  def require_admin
    if !admin_logged_in?
      flash[:danger] = "Cette action ne peut être effectuée que par un administrateur"
      redirect_to root_path
    end
  end
  def logged_in?
    (!!current_user)||(!!current_admin)
  end
  def require_logged
    if !logged_in?
      flash[:danger] = "Connectez-vous pour pouvoir effectuer cette action"
      redirect_to root_path
    end
  end

end

class WelcomeController < ApplicationController
  def users
    if admin_logged_in?
      render 'admins'
    end
  end
  def admins
  end
end

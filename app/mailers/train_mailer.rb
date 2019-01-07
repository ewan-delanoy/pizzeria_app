class TrainMailer < ApplicationMailer
  default from: 'ne-pas-repondre@pizzeria.com'

  def welcome_email
    #@user = params[:user]
    #@url  = 'http://example.com/login'
    mail(to: 'ewan.delanoy@zoho.com', subject: 'This is my first email')
  end

  def registration_confirmation_email(user)
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
  end


end

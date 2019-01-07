class TrainMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    #@user = params[:user]
    #@url  = 'http://example.com/login'
    mail(to: 'ewan.delanoy@zoho.com', subject: 'This is my first email')
  end
end

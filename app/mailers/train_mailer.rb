class TrainMailer < ApplicationMailer
  default from: 'ne-pas-repondre@pizzeria.com'

  def registration_confirmation_email(user)
    @user= user
    mail(:to => "#{user.first_name} #{user.last_name}  <#{user.email}>",
      :subject => "Confirmation d'inscription")
  end


end

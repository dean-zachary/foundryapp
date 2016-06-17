class UserMailer < ApplicationMailer
  default from: "dean_zachary@live.com"

  def registration_confimation(user)
  	@user = user
  	mail(:to => "{#user.name} <#{user.email}>", :subject => "Registration Confirmation")
  end
  
  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'dean_zachary@live.com',
        :subject => "A new contact form message from #{name}")
  end


end

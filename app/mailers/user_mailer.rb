class UserMailer < ApplicationMailer
  default from: "dean_zachary@live.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'dean_zachary@live.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
  	@appname="Bike Berlin"
  	mail(:to => user.email,
  		:subject => "Welcome! Thank you for joining #{(@appname)}")
  end
end

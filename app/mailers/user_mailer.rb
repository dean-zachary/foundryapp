class UserMailer < ApplicationMailer
  default from: "dean_zachary@live.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'dean_zachary@live.com',
        :subject => "A new contact form message from #{name}")
  end

  def order_confirm(email)
    @name = name
  	@email = email
  	mail( :to => user.email, 
         :subject => "Thank you for your purchase!")
  end
  

end

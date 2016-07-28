class PaymentsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
  	@user = current_user
    token = params[:stripeToken]

  	# Create the charge on Stripe's servers - this will charge the users's card

  	begin
  		charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i,
  			:currency => "usd",
  			:source => token,
  			:description => params[:stripeEmail]
  		)
      if signed_in?
  		  if charge.paid
  			  Order.create(product_id: @product.id, user_id: current_user.id, total: @product.price)
          @name = current_user.first_name
          @email = current_user.email
          UserMailer.order_confimr(@email).deliver_now
        else
          Order.create(product_id: @product.id, total: @product.price)  		  end
      end
    


  	rescue Stripe::CardError => e
  		#the card has been declined
  		body = e.json_body
  		err = body[:error]
  		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)  	
    end
  end
end
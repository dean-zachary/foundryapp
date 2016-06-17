class User < ActiveRecord::Base
	before_create :confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders
def email_activate
	self.email_confirmed = true
	self.confirm_token = nil
	save!(:validate => false)
end

  private
  def confirm_token
  	if self.confimr_token.blank?
  		self.confirm_token = SecureRandom.urlsafe_base64.to_s
  	end
  end




end

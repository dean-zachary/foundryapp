require "rails_helper"

describe UsersController, :type => :controller do 
  before do
	  @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end



  describe "GET #show" do
  	context "User is logged in" do
   	  before do
		  sign_in @user
      end


      it "loads correct user details" do
    	  get :show, id: @user.id
    	  expect(response).to have_http_status(302)
    	  expect(assigns(:user)).to eq @user
  	  end
    end

    context "User tries to access second user show page" do
    	it "redirects to login" do
    		get :show, id: @user2.id
    		expect(response).to redirect_to("/users/sign_in")
    	end
    end


  	context "No user is logged in" do
  		it "redirects to login" do
  			get :show, id: @user.id
  			expect(response).to redirect_to("/users/sign_in")
  		end
  	end
  end
end

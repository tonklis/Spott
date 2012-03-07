 class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def twitter
  	@user = User.find_for_twitter_oauth(auth_hash)
  	sign_in @user
  	session["devise.uid"] = auth_hash["uid"]
  	redirect_to places_url
  end
 
  def auth_hash
		request.env['omniauth.auth']
 	end 
end
 

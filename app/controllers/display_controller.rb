class DisplayController < ApplicationController
	before_filter :authenticate_user!, :except => [:index]
   
  def index 
  	@user = User.find_by_u_id(session["devise.uid"])
  end
	
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

	has_many :dfiles
	has_many :checkins

	def self.find_for_twitter_oauth(auth_hash)
		user = User.find_by_twitter_id auth_hash["uid"]
		if not user
 			user = Usuario.new
 			user.u_id = twitter_id = auth_hash["uid"]
 			user.name = auth_hash["info"]["name"]
 			user.email = auth_hash["info"]["nickname"]
 			user.save!
		end
		usuario
	end

	def self.encuentra_o_crea(params_id){
		user = User.find_by_u_id(params_id)
		if not user
				user = User.new
 				user.u_id = params_id
 				user.email = params_id
 				user.save!
		end
		user	
	}

end

class Dfile < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

	def self.save_file(params)
		
		dfile = Dfile.new
    dfile.name = params['name']
		dfile.user_id = User.find_by_u_id(params['u_id']).id
		
		file = params['userfile']
    directory = "public/data"
    # create the file path
    dfile.location = File.join(directory, dfile.name)
    # write the file
    File.open(dfile.location, "wb") { |f| f.write(file.read) }
		
		dfile.save!

  end
	
end

class Dfile < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

	def self.save_file(params)
		
		dfile = Dfile.new
    dfile.name = params['name']
		dfile.user_id = User.find_by_u_id(params['u_id']).id
		dfile.place_id = Place.find_by_id(params['place_id']).id
		
		file = params['userfile']
    dir_name = "public/data/#{dfile.place_id}"
		if not FileTest::directory?(dir_name)
			Dir::mkdir(dir_name, 755)
		end

    # create the file path
    dfile.location = File.join(dir_name, dfile.name)
    # write the file
    File.open(dfile.location, "wb") { |f| f.write(file.read) }
		
		dfile.save!
		return dfile
  end
	
end

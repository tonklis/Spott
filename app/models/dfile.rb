class Dfile < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

	def self.save_file(params)
		
		dfile = Dfile.new
		dfile.user_id = User.find_by_u_id(params['u_id']).id
		dfile.place_id = Place.find_by_id(params['place_id']).id
		
		file = params['userfile']
    dfile.name = params['name'] + file.original_filename
		dfile.description = params['description']
    dir_name = "public/data/#{dfile.place_id}"
		if not FileTest::directory?(dir_name)
			#arreglar este bug, no crea correctamente directorios
			Dir::mkdir(dir_name, 777)
		end

    # create the file path
    dfile.location = File.join(dir_name, dfile.name)
    # write the file
    File.open(dfile.location, "wb") { |f| f.write(file.read) }
		
		dfile.save!
		return dfile
  end
	
end

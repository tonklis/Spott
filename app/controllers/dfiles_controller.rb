class DfilesController < ApplicationController
  # GET /dfiles
  # GET /dfiles.json
  def index
    @dfiles = Dfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dfiles }
    end
  end

  # GET /dfiles/1
  # GET /dfiles/1.json
  def show
    @dfile = Dfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dfile }
    end
  end

  # GET /dfiles/new
  # GET /dfiles/new.json
  def new
    @dfile = Dfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dfile }
    end
  end

  # GET /dfiles/1/edit
  def edit
    @dfile = Dfile.find(params[:id])
  end

  # POST /dfiles
  # POST /dfiles.json
  def create
    @dfile = Dfile.new(params[:dfile])

    respond_to do |format|
      if @dfile.save
        format.html { redirect_to @dfile, notice: 'Dfile was successfully created.' }
        format.json { render json: @dfile, status: :created, location: @dfile }
      else
        format.html { render action: "new" }
        format.json { render json: @dfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dfiles/1
  # PUT /dfiles/1.json
  def update
    @dfile = Dfile.find(params[:id])

    respond_to do |format|
      if @dfile.update_attributes(params[:dfile])
        format.html { redirect_to @dfile, notice: 'Dfile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dfiles/1
  # DELETE /dfiles/1.json
  def destroy
    @dfile = Dfile.find(params[:id])
    @dfile.destroy

    respond_to do |format|
      format.html { redirect_to dfiles_url }
      format.json { head :ok }
    end
  end

	def receive
		@dfile = Dfile.save_file(params)

		respond_to do |format|
			format.json { head :ok }
		end
	end

end

class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @gallery = Gallery.find(params[:gallery_id])
    
    @images = @gallery.images

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])
    
    myurl = @image.gallery_id.to_s
    
    redirect_to "/galleries/"+myurl+"/" 
=begin
  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
=end
  

    
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new
    
    @image.gallery_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])
    
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    
    myurl = @image.gallery_id.to_s
    
    @image.destroy
    
    respond_to do |format|
      #format.html { redirect_to images_url }
      format.html { redirect_to "/galleries/"+myurl+"/images"  }
      format.json { head :no_content }
    end
  end
end

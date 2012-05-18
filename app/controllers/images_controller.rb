class ImagesController < ApplicationController
  def index
    @gallery = Gallery.find(params[:gallery_id])
    
    @images = @gallery.images

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new    
    @image.gallery_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  def edit
    @image = Image.find(params[:id])
  end
  
  def create
    @image = Image.new(params[:image])
    @gallery = @image.gallery_id
    
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully added.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
  
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
  
  def destroy
    @image = Image.find(params[:id])
    @gallery = Gallery.find(@image.gallery_id)
    @image.destroy
    respond_to do |format|
      format.html { redirect_to @gallery, notice: 'Image successfully deleted from gallery.'  }
      format.json { head :no_content }
    end
  end
end

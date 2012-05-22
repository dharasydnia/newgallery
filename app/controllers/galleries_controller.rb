class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  def show    
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images.paginate :page => params[:page], :per_page => 6
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
      format.json { render json: @images }
      
    end
  end

  def new
    @gallery = Gallery.new
    
    1.times do
      5.times { @gallery.images.build }
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    3.times { @gallery.images.build }
  end

  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def rate
    @gallery = Gallery.find(params[:id])
    @gallery.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @gallery.wrapper_dom_id(params), ratings_for(@gallery, params.merge(:wrap => false))
      page.visual_effect :highlight, @gallery.wrapper_dom_id(params)
    end
  end
  
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery successfully deleted!' }
      format.json { head :no_content }
    end
  end
end
class PhotoAlbumsController < ApplicationController
  # GET /photo_albums
  # GET /photo_albums.xml
  def index
     if params[:page]
       @photo_albums = PhotoAlbum.with_photos.find(:all, :order => "id desc").paginate(:page => params[:page], :per_page => 30)
     else
       @photo_albums = PhotoAlbum.with_photos.find(:all, :order => 'id desc')
     end

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @photo_albums }
       format.json  { render :json => @photo_albums}
     end
   end

  # GET /photo_albums/1
  # GET /photo_albums/1.xml
  def show
    @photo_album = PhotoAlbum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo_album }
    end
  end

  # GET /photo_albums/new
  # GET /photo_albums/new.xml
  def new
    @photo_album = PhotoAlbum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo_album }
    end
  end

  # GET /photo_albums/1/edit
  def edit
    @photo_album = PhotoAlbum.find(params[:id])
  end

  # POST /photo_albums
  # POST /photo_albums.xml
  def create
    @photo_album = PhotoAlbum.new(params[:photo_album])

    respond_to do |format|
      if @photo_album.save
        flash[:notice] = 'PhotoAlbum was successfully created.'
        format.html { redirect_to(@photo_album) }
        format.xml  { render :xml => @photo_album, :status => :created, :location => @photo_album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photo_albums/1
  # PUT /photo_albums/1.xml
  def update
    @photo_album = PhotoAlbum.find(params[:id])

    respond_to do |format|
      if @photo_album.update_attributes(params[:photo_album])
        flash[:notice] = 'PhotoAlbum was successfully updated.'
        format.html { redirect_to(@photo_album) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_albums/1
  # DELETE /photo_albums/1.xml
  def destroy
    @photo_album = PhotoAlbum.find(params[:id])
    @photo_album.destroy

    respond_to do |format|
      format.html { redirect_to(photo_albums_url) }
      format.xml  { head :ok }
    end
  end
end

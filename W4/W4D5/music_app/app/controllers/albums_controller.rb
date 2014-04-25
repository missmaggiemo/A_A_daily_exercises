class AlbumsController < ApplicationController
  
  def new
    @album = Album.new
    @bands = Band.all
  end
  
  def create
    @band = Band.find(params[:album][:band_id])
    @album = Album.new(album_params)
    @bands = Band.all
    if @album.save
      redirect_to url_for([@band, @album])
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    
    if @album.update(album_params)
      redirect_to url_for([@band, @album])
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.delete
  end
  
  def index
    @albums = Album.all
  end
  
  def show
    @track = Track.new
    @album = Album.find(params[:id])
  end

  private
  
  def album_params
    params.require(:album).permit(:title, :band_id, :live)
  end
  
end

class TracksController < ApplicationController
  
  def new
    @track = Track.new
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
  end
  
  def create
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    params[:track][:album_id] = params[:album_id]
    @track = Track.new(track_params)
    if @track.save
      redirect_to url_for([@band, @album, @track])
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find(params[:id])
    
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.delete
  end
  
  def index
    @tracks = Track.all
  end
  
  def show
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    @track = Track.find(params[:id])
    @new_note = Note.new
  end

  private
  
  def track_params
    params.require(:track).permit(:title, :album_id, :bonus)
  end
  
end

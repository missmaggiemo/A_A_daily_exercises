class NotesController < ApplicationController
  
  def create
    params[:note][:user_id] = current_user.id
    @note = Note.new(note_params)
    if @note.save
      redirect_to url_for([@note.band, @note.album, @note.track])
    else
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    band, album, track = @note.band, @note.album, @note.track
    @note.delete
    redirect_to url_for([band, album, track])
  end
  
  private
  
  def note_params
    params.require(:note).permit(:body, :user_id, :track_id)
  end
  
end

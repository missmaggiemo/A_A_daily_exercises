class TracksController < ApplicationController
  
  def new
    
  end
  
  def create
    
  end

  def update
    
  end
  
  def destroy
    
  end
  
  def index
    
  end
  
  def show
    
  end
  
  private
  
  def band_params
    params.require(:track).permit(:title, :album_id)
  end
  
end

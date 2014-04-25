class BandsController < ApplicationController
  
  def new
    @band = Band.new
  end
  
  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def update
    @band = Band.find(params[:id])
    
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @band = Band.find(params[:id])
    @band.delete
  end
  
  def index
    @bands = Band.all
  end
  
  def show
    @band = Band.find(params[:id])
  end

  private
  
  def band_params
    params.require(:band).permit(:name)
  end
  
end

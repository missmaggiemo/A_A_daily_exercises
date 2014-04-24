class CatRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all
  end

  def show
    @request = CatRentalRequest.find(params[:id])
  end

  def new
    @request = CatRentalRequest.new()
    @cats = Cat.all
  end

  def edit
    @request = CatRentalRequest.find(params[:id])
    @cats = Cat.all
  end

  def update
    @request = CatRentalRequest.find(params[:id])
    if @request.valid?
      @request.update(request_params)
      redirect_to cat_url(@request.cat)
    else
      @request.errors.full_messages
    end
  end

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.valid?
      @request.save!
      redirect_to cat_url(@request.cat)
    else
      @request.errors.full_messages
    end
  end

  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    redirect_to cat_url(@request.cat)
  end

  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    redirect_to cat_url(@request.cat)
  end

  private

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

end

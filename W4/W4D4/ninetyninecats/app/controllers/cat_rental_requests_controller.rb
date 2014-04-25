class CatRentalRequestsController < ApplicationController
  before_action :current_user_owns_cat, only: [:approve, :deny]

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
    @request.approve!
    redirect_to cat_url(@request.cat)
  end

  def deny
    @request.deny!
    redirect_to cat_url(@request.cat)
  end

  private

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

  def current_user_owns_cat
    @request = CatRentalRequest.find(params[:id])
    if @request.cat.user_id != current_user.id
      flash[:errors] ||= []
      flash[:errors] << "You do not own that cat, thief!"
      redirect_to cat_url(@request.cat)
    end
  end

end

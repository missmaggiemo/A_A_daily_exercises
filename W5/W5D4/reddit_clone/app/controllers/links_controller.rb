class LinksController < ApplicationController

  before_action :set_link, only: [:show, :edit, :update, :destroy]

  before_action :require_logged_in, only: [:new, :create, :destroy]

  def new
    @link = Link.new
  end

  def create
    params[:link][:user_id] = current_user.id
    @link = Link.new(link_params)
    @sub = Sub.find_by(sub_params)

    if @sub.nil?
      flash.now[:errors] = ["Sub does not exist"]
      render :new
    else
      if @link.save
        SubMembership.create(link_id: @link.id, sub_id: @sub.id)
        redirect_to link_url(@link)
      else
        flash.now[:errors] = @link.errors.full_messages
        render :new
      end
    end
  end

  def show

  end

  def index
    @links = Link.all
  end

  def edit
  end

  def update
  end

  def destroy
    if @link
      redirect_to link_url(@link) unless @link.user == current_user
      @link.delete
      redirect_to links_url
    else
      redirect_to links_url
    end
  end

  private
  def link_params
    params.require(:link).permit(:user_id, :title, :url)
  end

  def sub_params
    params.require(:sub).permit(:name)
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

end

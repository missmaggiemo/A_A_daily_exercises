class SubsController < ApplicationController

  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
  end

  def index
    @subs = Sub.all
  end

  def edit
    redirect_to sub_url(@sub) unless @sub.moderator == current_user
  end

  def update
    if @sub
      redirect_to sub_url(@sub) unless @sub.moderator == current_user
      if @sub.update(sub_params)
        redirect_to sub_url(@sub)
      else
        flash.now[:errors] = @sub.errors.full_messages
        render :new
      end
    end
  end

  def destroy
    if @sub
      redirect_to sub_url(@sub) unless @sub.moderator == current_user
      @sub.delete
      redirect_to subs_url
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:user_id, :name)
  end

  def set_sub
    @sub = Sub.find(params[:id])
  end

end

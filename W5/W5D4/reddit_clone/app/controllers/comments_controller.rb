class CommentsController < ApplicationController

  before_action :set_link

  before_action :set_comment, only: [:destroy, :edit, :update]

  def new
    @comment = Comment.new
    @comment.parent_comment_id = params[:parent_comment_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.link_id = @link.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @comments.errors.full_messages
      redirect_to link_url(@link)
    end
  end

  def destroy

  end

  def edit

  end

  def update

  end

  private
  def comment_params
    params.require(:comment).permit(:body, :parent_comment_id)
  end

  def set_link
    @link = Link.find(params[:link_id])
  end

  def set_comment
    @comment = Link.find(params[:id])
  end


end

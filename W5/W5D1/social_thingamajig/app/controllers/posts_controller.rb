class PostsController < ApplicationController

  before_action :set_user
  before_action :set_post, only: [:show, :update, :destroy, :edit]

  def new
    @post = @user.posts.new
    3.times { @post.links << Link.new }
  end

  def create
    @post = @user.posts.new(post_params)
    @post.links.new(link_params)

    if @post.save
      redirect_to user_post_url(@user, @post)
    else
      (3 - @post.links.length).times { @post.links << Link.new }
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post && @post.update(post_params)
      redirect_to user_post_url(@user, @post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @post
      @post.delete
      redirect_to user_url(@user)
    end
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :body, :title, :circle_ids => [])
  end

  def link_params
    params.permit(links: [:title, :url]).require(:links).values.reject { |data| data.values.all?(&:empty?) }
  end

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

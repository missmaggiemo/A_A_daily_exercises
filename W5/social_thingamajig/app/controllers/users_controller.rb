class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  def new
    @user = User.new
    @post = @user.posts.new
    3.times { @post.links << Link.new }
  end

  def create
    @user = User.new(user_params)
    @post = @user.posts.new(post_params).first
    @links = @post.links.new(link_params) unless @post.nil?

    if @user.save
      login_user!(@user)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show

  end

  def destoy
    @user.delete if @user
  end

  def index
    render :json => User.all
  end

  def update

  end

  def edit

  end

  def feed
    @user = current_user
    if @user
      @shared_posts = (@user.shared_posts.to_a + @user.posts.to_a).uniq
    else
      redirect_to new_session_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end

    def post_params
      params.permit(posts: [:title, :body]).require(:posts).values.reject { |data| data.values.all?(&:empty?) }
    end

    def link_params
      params.permit(links: [:title, :url]).require(:links).values.reject { |data| data.values.all?(&:empty?) }
    end

end

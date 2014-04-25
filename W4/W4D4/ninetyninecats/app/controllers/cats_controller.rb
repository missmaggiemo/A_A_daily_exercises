class CatsController < ApplicationController
  before_action :current_user_owns_cat, only: [:edit, :update]

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new(cat_params)
  end

  def edit
  end

  def update
    if @cat.valid?
      @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      @cat.errors.full_messages
    end
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.valid?
      @cat.save!
      redirect_to cat_url(@cat)
    else
      @cat.errors.full_messages
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :age, :birth_date, :sex)
  end

  def current_user_owns_cat
    @cat = Cat.find(params[:id])
    if @cat.user_id != current_user.id
      flash[:errors] ||= []
      flash[:errors] << "You do not own that cat, thief!"
      redirect_to cat_url(@cat)
    end
  end

end

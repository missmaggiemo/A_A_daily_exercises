class CatsController < ApplicationController

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
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.valid?
      @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      @cat.errors.full_messages
    end
  end

  def create
    @cat = Cat.new(cat_params)
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

end

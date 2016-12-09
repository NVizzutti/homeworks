class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.where(id: params[:id])
    if @cat.empty?
      redirect_to cats_url
    else
      @cat = @cat.first
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    render json: params
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end

class CatsController < ApplicationController
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def new
    @cat = Cat.new
    render :new
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: @cat, status: :created
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end




  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      render json: @cat
    else
      render plain: "error"
    end
  end



  private

  def cat_params
    params.require(:cat).permits(:birthdate, :color, :name, :sex, :description)
  end

end

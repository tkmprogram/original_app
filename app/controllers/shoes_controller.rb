class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.create(shoe_params)
    if @shoe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  private

  def shoe_params
    params.require(:shoe).permit(:image, :title, :explanation, :manufacturer_id, :color_id, :inout_id).merge(user_id: current_user.id)
  end
end

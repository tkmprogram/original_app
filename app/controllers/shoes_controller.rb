class ShoesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

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

  def edit
    @shoe = Shoe.find(params[:id])
    unless user_signed_in? && @shoe.user.id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @shoe = Shoe.find(params[:id])
    @shoe.update(shoe_params)
    if @shoe.save
      redirect_to shoe_path
    else
      render :edit
    end
  end


  def destroy
    shoe = Shoe.find(params[:id])
    shoe.destroy
    if shoe.destroy
      redirect_to root_path
    end
  end

  private

  def shoe_params
    params.require(:shoe).permit(:image, :title, :explanation, :manufacturer_id, :color_id, :inout_id).merge(user_id: current_user.id)
  end
end

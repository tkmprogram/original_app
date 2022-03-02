class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @shoes = @user.shoe
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.permit(:nickname, :email)
  end

end

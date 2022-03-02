class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shoes = @user.shoe
  end
end

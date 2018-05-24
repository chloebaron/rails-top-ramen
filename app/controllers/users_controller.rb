class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @reviews = @user.reviews
    authorize @reviews
    authorize @user
    #raise
  end
end

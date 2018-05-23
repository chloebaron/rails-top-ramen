class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user

    #raise
  end
end

class UsersController < ApplicationController
  def dashboard
    @user = current_user
    #raise
  end
end

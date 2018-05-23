class FavouritesController < ApplicationController

  def index
    @fav_ramens = policy_scope(Ramen).joins(:favourites).where('favourites.user_id = ?', current_user.id)
    @user = current_user
  end

  def create
    authorize Favourite.create(user_id: current_user.id, ramen_id: params[:ramen_id])
    #refreshes show page
    redirect_to ramen_path(params[:ramen_id])
  end
end

class FavouritesController < ApplicationController

  def index
    @fav_ramens = policy_scope(Ramen).joins(:favourites).where('favourites.user_id = ?', current_user.id)
    @user = current_user
  end

  def create
    authorize Favourite.create(user_id: current_user.id, ramen_id: params[:ramen_id], accepted: "Pending")
    #refreshes show page
    redirect_to ramen_path(params[:ramen_id])
  end

  def update
    @fav = Favourite.find(params[:id])
    authorize @fav
    @fav.accepted = "Accepted"
    @fav.save
    redirect_to dashboard_path
  end

  def destroy
    @fav = Favourite.find(params[:id])
    authorize @fav
    @fav.destroy
    redirect_to dashboard_path
  end
end

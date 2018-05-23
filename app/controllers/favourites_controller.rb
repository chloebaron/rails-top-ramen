class FavouritesController < ApplicationController
  def create
    Favourite.create(user_id: current_user.id, ramen_id: params[:ramen_id], accepted: "Pending")
    #refreshes show page
    redirect_to ramen_path(params[:ramen_id])
  end

  def update
    @fav = Favourite.find(params[:id])
    @fav.accepted = "Acccepted"
    @fav.save
    redirect_to dashboard_path
  end

  def destroy
    @fav = Favourite.find(params[:id])
    @fav.destroy
    redirect_to dashboard_path
  end
end

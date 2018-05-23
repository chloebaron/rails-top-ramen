class FavouritesController < ApplicationController
  def create
    Favourite.create(user_id: current_user.id, ramen_id: params[:ramen_id], accepted: "Pending")
    #refreshes show page
    redirect_to ramen_path(params[:ramen_id])
  end

  def update
    Favourite.joins(:)

  end
end

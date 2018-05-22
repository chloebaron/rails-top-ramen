class FavouritesController < ApplicationController

  def create
    # ------------------------------
    # favourite = Favourite.new
    # favourite.ramen = Ramen.find(params[:id])
    # favourite.user = current_user
    # favourite.save!
    # ------------------------------ both ways would work
    Favourite.create!(user_id: current_user.id, ramen_id: params[:ramen_id])
  end
end

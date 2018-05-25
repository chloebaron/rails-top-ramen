class TastesController < ApplicationController
  def create
    @ramen = Ramen.find(params[:ramen_id])
    @taste = Taste.new(portion_id: @ramen.portions[0].id, user_id: current_user.id, accepted: false)
    authorize @taste
    @taste.save!
    #raise
    redirect_to ramen_path(@ramen)
  end

  def update
    @taste = Taste.find(params[:id])
    authorize @taste
    @taste.accepted = true
    @taste.save
    redirect_to dashboard_path
  end

  def destroy
    @taste = Taste.find(params[:id])
    authorize @taste
    @taste.destroy
    redirect_to dashboard_path
  end
end

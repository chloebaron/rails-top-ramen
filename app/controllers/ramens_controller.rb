class RamensController < ApplicationController
  before_action :find_ramen, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @ramens = Ramen.all
    @restaurants = policy_scope(Ramen).order(created_at: :DESC)
    @user = current_user
  end

  def show
    @user = current_user
    authorize @ramen
  end

  def new
    @ramen = Ramen.new
    authorize @ramen
  end

  def create
    user = current_user
    @ramen = Ramen.new(ramen_params)
    authorize @ramen
    @ramen.user = user
    if @ramen.save!
      redirect_to ramen_path(@ramen)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def find_ramen
    @ramen = Ramen.find(params[:id])
  end

  def ramen_params
    params.require(:ramen).permit(:name, :description)
  end
end

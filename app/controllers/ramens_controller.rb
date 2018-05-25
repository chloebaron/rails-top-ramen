class RamensController < ApplicationController
  before_action :find_ramen, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :home, :show]

  def index
    @ramens = policy_scope(Ramen)
    @user = current_user

    if params[:query].present?
      @ramens = Ramen.global_search(params[:query])
    else
      @ramens = Ramen.all
    end

  end

  def show
    @portion = @ramen.portions[0]
    @user = current_user
    @taste = Taste.where("portion_id= ?", @portion.id)[0]
    @review = Review.new
    @tags = Tag.where(ramen_id: params[:id])
    @reviews = Review.where(ramen_id: @ramen.id)
    unless @user.nil?
      @favourite = Favourite.where(user_id: @user.id, ramen_id: @ramen.id).first
    end
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

  def edit
    @tags = Tag.where(ramen_id: params[:id])
    @tag = Tag.new
    authorize @ramen
  end

  def update
    authorize @ramen
    @ramen.update(ramen_params)
  end

  def destroy
    authorize @ramen
  end

  def search
  end

  private

  def find_ramen
    @ramen = Ramen.find(params[:id])
  end

  def ramen_params
    params.require(:ramen).permit(:name, :description, :photo, :portions, :price_per_portion)
  end

end

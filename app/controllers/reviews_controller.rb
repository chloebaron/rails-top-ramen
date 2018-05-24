class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    if authorize Review.create!(
      ramen_id: params[:ramen_id],
      user_id: current_user.id,
      content: review_params[:content]
      )
      redirect_to ramen_path(params[:ramen_id])
    else
      render :new
    end
  end

  def destroy
    #we have to find @review first depends on what page generates it
    authorize @review
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

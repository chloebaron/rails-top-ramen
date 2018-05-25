class ReviewsController < ApplicationController
  def show
    @ramen = Ramen.find(params[:ramen_id])
    @review = Review.new
  end

  def new

  end

  def create
    @ramen = Ramen.find(params[:ramen_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.ramen = @ramen

    authorize @review
    if @review.save!
      respond_to do |format|
      format.html { redirect_to ramen_path(@ramen) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
      # redirect_to ramen_path(params[:ramen_id])
    else
      respond_to do |format|
        format.html { render 'ramens/show' }
        format.js  # <-- idem
      end
    end


  #       if @review.save
  #     respond_to do |format|
  #       format.html { redirect_to restaurant_path(@restaurant) }
  #       format.js  # <-- will render `app/views/reviews/create.js.erb`
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render 'restaurants/show' }
  #       format.js  # <-- idem
  #     end
  #   end
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

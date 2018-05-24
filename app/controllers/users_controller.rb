class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @reviews_myself = @user.reviews
    @reviews_others = Ramen.where(user_id: @user.id).map do |ramen|
       Review.where(ramen_id: ramen.id)
    end
    @reviews_others.flatten!
    authorize @reviews_myself
    # authorize @reviews_others unless @reviews_others.nil?
    authorize @user
    #raise
  end
end

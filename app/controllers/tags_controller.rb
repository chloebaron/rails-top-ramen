class TagsController < ApplicationController

  def new
  end

  def create
    if authorize Tag.create!(
      ramen_id: params[:id],
      category_id: tag_params[:category_id],
      )
    else
      render :new
    end
  end

  def destroy
    @tag = Tag.find_by(ramen_id: params[ramen_id])
    @tag.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:ramen_id, :category_id)
  end
end
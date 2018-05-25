class TagsController < ApplicationController

  def new
  end

  def create
    @ramen = Ramen.find(params[:id])
    @tag = Tag.new(category: tag_params[:category])
    @tag.ramen = @ramen
    authorize @tag
    if @tag.save
      redirect_to ramen_path(@ramen)
    else
      redirect_to edit_ramen_path(@ramen)
    end
  end

  def destroy
    @tag = Tag.find_by(ramen_id: params[ramen_id])
    @tag.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:ramen_id, :category)
  end

end

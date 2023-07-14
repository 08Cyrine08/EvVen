class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @user = current_user
    @tag = Tag.new(tag_params)
    @venue = Venue.find(params[:venue_id])
    @tag.user = @user
    @tag.venue = @venue
    authorize @tag
    if @tag.save
      redirect_to venue_path(@venue), notice: "Tag added successfully."
    else
      render :new
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    authorize @tag
    @tag.destroy
    redirect_to "/venues/#{@tag.venue_id}"
  end

  private

  def tag_params
    params.require(:tag).permit(:text, :user_id, :venue_id)
  end

end

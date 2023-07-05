class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    @review.user_id = @user.id
    authorize @review
    if @review.save
      redirect_to "/venues/#{@venue.id}", notice: "Review created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

    @review = Review.find(params[:id])
    authorize @review

    @review.destroy
    redirect_to "/venues/#{@review.venue_id}"
  end

  private

  def review_params
    params.require(:review).permit(:venue_id, :text, :rating)
  end
end

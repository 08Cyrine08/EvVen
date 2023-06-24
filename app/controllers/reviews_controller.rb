class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    if @review.save
      redirect_to "/venues/#{@venue.id}", notice: "Review created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:venue_id, :text, :rating)
  end
end

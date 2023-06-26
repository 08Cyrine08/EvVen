class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_params, only: %i[show edit update destroy]

  def index
    @venues = Venue.all
  end

  def show
    @booking = Booking.new
    @review =  Review.new
    @reviews = Review.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @user = current_user
    @venue = Venue.new(venue_params)
    @venue.user = @user
    if @venue.save
      redirect_to venue_path(@venue), notice: "Venue created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: "Venue updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, notice: "Venue deleted successfully.", status: :see_other
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :description, :price, :availability_dates, :tags, :user_id, :picture, photos: [])
  end

  def set_params
    @venue = Venue.find(params[:id])
  end
end

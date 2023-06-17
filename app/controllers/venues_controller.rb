class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
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
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: "Venue updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_path, notice: "Venue deleted successfully."
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :description, :price, :availability_dates, :tags, :user_id, :picture)
  end
end

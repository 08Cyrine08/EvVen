class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.user = @user
    @booking.venue = @venue
    authorize @booking
    if @booking.save

      redirect_to venue_path(@venue), notice: "Booking request created successfully."

    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: "Booking request updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :venue_id, :booking_start_date, :booking_end_date, :amount_guests)
  end
end

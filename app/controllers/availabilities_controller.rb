class AvailabilitiesController < ApplicationController
  def index
    @city = params[:city]
    @date = params[:date]
    @venues = Venue.available_in_city_on_date(@city, @date)
  end

  def check_availability
    @venue = Venue.find(params[:venue_id])
    @date = params[:date]
    @availability = @venue.check_availability(@date)
  end
end

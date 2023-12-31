class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = current_user
    @bookings = @user.bookings if @user.bookings.present?
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = current_user
    if @user.detail.present?
      @detail = @user.detail
    else
      @detail = Detail.new
    end
  end
end

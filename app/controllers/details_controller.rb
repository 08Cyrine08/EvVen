class DetailsController < ApplicationController

  def new
    @user = current_user
    @detail = Detail.new
  end

  def create
    @user = current_user
    @detail = Detail.new(detail_params)
    @detail.user = @user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def detail_params
    params.require(:detail).permit(:user_id, :content)
  end

end

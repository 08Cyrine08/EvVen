class DetailsController < ApplicationController

  def new
    @user = current_user
    @detail = Detail.new
  end

  def create
    @user = current_user
    @detail = Detail.new(detail_params)
    @detail.user = @user
    if @detail.save
      redirect_to profile_path
    end
  end

  def edit
    @detail = current_user.detail
  end

  def update
    @detail = current_user.detail

  end

  def destroy
    @detail = current_user.detail
    @detail.destroy
    redirect_to profile_path

  end

  private

  def detail_params
    params.require(:detail).permit(:user_id, :content)
  end

end

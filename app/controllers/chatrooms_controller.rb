class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])

    @message = Message.new
  end


  private

  def venue_params
    params.require(:chatroom).permit(:name)
  end
end

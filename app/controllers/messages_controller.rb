class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @rooms = Room.all.order('created_at DESC')
    @messages = @room.messages.includes(:user)
    @latest = Room.last(5)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end

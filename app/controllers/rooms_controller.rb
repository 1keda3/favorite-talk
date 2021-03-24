class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @rooms = Room.all.order('created_at DESC')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:title, :genre_id)
  end
end

class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :latest_room

  def index
    @rooms = Room.all.order('created_at DESC')
  end

  def new
    @room = RoomsTag.new
  end

  def create
    @room = RoomsTag.new(room_params)
    if @room.valid?
      @room.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def search
    @rooms = Room.search(params[:keyword])
  end


  private
  
  def room_params
    params.require(:rooms_tag).permit(:title, :name)
  end

  def latest_room
    @latest = Room.last(5)
  end
end


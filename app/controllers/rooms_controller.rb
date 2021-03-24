class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @rooms = Room.all.order('created_at DESC')
  end

  def new
    @room = RoomsTagForm.new
  end

  def create
    @room = RoomsTagForm.new(room_params)
    if @room.valid?
      @room.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def room_params
    params.require(:rooms_tag_form).permit(:title, :name)
  end
end

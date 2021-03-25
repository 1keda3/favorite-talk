class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private
  
  def room_params
    params.require(:rooms_tag).permit(:title, :name)
  end
end


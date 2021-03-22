class TagsController < ApplicationController

  def index
  end

  def create
    @room = Room.find(params[:room_id])
    @tag = Tag.new(tag_params)
    binding.pry
    if @tag.save
      redirect_to root_path
    end
  end

  private

  def tag_params
    params.permit(:tag_name, room_id: @room.id)
  end
end

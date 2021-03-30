class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @rooms = Room.all.order('created_at DESC')
    @room = RoomsTag.new

  end

  def new
  end

  def create
  end

  def search
    @tags = Tag.search(params[:keyword])
  end
end

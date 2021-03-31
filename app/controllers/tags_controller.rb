class TagsController < ApplicationController
  before_action :word_definition, only: [:index, :show]

  def index
    @tags = Tag.all
    @rooms = Room.all.order('created_at DESC')
    @room = RoomsTag.new
  end

  def new
    @tag = Tag.new
  end

  def create
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def search
    @tags = Tag.search(params[:keyword])
  end

  private
  
  def word_definition
    @tags = Tag.all
    @tag = Tag.new
    @rooms = Room.all.order('created_at DESC')
    @room = RoomsTag.new
  end

end

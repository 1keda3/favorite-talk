class UsersController < ApplicationController
  before_action :latest_room


  def show
    @user = User.find(params[:id])
    @rooms = Room.all.order('created_at DESC')
  end

  private
  
  def latest_room
    @latest = Room.last(5)
  end
end

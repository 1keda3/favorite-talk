class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rooms = Room.all.order('created_at DESC')
  end

end

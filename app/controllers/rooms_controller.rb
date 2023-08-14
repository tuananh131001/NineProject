class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @room = Room.new
  end

  def create
    @room = Room.create(name: params["room"]["name"])

    respond_to do |format|
      if @room.save
        format.html { redirect_to '/', notice: 'Room was successfully created' }
        format.json { render :@room.json }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
end

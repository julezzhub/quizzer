class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @name = current_user.username
    current_user.update(room: Room.find_by(name: "Lobby"))
  end

  def show
    @room = Room.find(params[:id])
    current_user.update(room: @room)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save

    redirect_to room_path(@room)
  end

  def ready
    current_user.update(ready: true)
    ActionCable.server.broadcast("room_id_#{current_user.room.id}", {
      message: "test".to_json
    })
  end

  def leave_room
    current_user.update(ready: false)
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end

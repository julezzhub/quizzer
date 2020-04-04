class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @name = current_user.username
    current_user.update(room: Room.find_by(name: "Lobby"))
  end

  def show
    @room = Room.find(params[:id])
    if current_user.room != @room
      ActionCable.server.broadcast("room_#{params[:id]}", {
        joined: current_user.username
      })
    end
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
    ActionCable.server.broadcast("room_#{params[:id]}", {
      ready: current_user.username
    })
    redirect_to room_path(params[:id])
  end

  def leave_room
    current_user.update(ready: false)
    ActionCable.server.broadcast("room_#{current_user.room.id}", {
      left: current_user.username
    })
    ActionCable.server.broadcast("room_#{Room.find_by(name: "Lobby").id}", {
      from: "room #{current_user.room.id}"
    })
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end

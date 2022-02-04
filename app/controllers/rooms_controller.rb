class RoomsController < ApplicationController
    # List All Rooms
    def index
        @rooms = Room.all
    end   
    
     # Specific Room
    def show
        @id = params[:id]
        @room = Room.find(@id)
        @messages = Message.where(room: @room)
    end     
end

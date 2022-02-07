class RoomsController < ApplicationController
    # List All Rooms
    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @rooms = Room.all
        @users = User.all_except(@current_user)
    end   
    
     # Specific Room
    def show
        @current_user = current_user
        @room = Room.find(params[:id])
        @users = User.all_except(@current_user)
        @messages = Message.where(room_id:@room )
    end     

    def new
        @room = Room.new
    end
    
    def create
      @room = Room.new(room_params)
  
      if @room.save
        redirect_to rooms_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
      @room = Room.find(params[:id])
  
      if @room.update(room_params)
        redirect_to @room
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
    
        redirect_to rooms_path, status: :see_other
      end

    private
    def room_params
        params.require(:room).permit(:title,:description)
    end
end

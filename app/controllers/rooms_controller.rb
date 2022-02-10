class RoomsController < ApplicationController
    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @rooms = Room.includes(:messages).order('messages.id DESC' )
        @users = User.all_except(@current_user)
    end   
    
    def show
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @room = Room.find(params[:id])
        @messages = Message.where(room_id:@room ).last(50)
    end     

    def new
        @current_user = current_user
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
        @current_user = current_user
        if @current_user.admin != true 
          redirect_to rooms_path
        end
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

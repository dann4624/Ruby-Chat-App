class MessagesController < ApplicationController
    def new
      @message = @room.messages.new
      redirect_to room_path(@room.id)
    end
  
    def create
      @current_user = current_user
      @message = Message.create(room_id: params[:room_id], user_id:current_user.id, content: params[:content] )
      if @message.save
        redirect_to room_path(params[:room_id])
      else
        redirect_to room_path(params[:room_id]), :notice =>"Could not send message"
      end
    end    
    
    def destroy
      @message = Message.find(params[:id])
      @message.destroy
      redirect_to room_path(params[:room_id])
    end
end

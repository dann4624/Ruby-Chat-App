class MessagesController < ApplicationController
    def new
      @current_user = current_user
      @message = @room.messages.new
      redirect_to room_path(@room.id)
    end
  
    def create
      @current_user = current_user
  
      @message = Message.create(room_id: params[:room_id], user_id:current_user.id, content: params[:content])
      @room = Room.find(@message.room_id)
      if @message.save
        redirect_to room_path(@message.room_id)
      else
        redirect_to room_path(@message.room_id), :notice =>"Could not send message"
      end
    end    

    def edit
      @message = Message.find(params[:id])
      @room_id = @message.room_id
      @current_user = current_user
      redirect_to '/signin' unless @current_user
    end

    def update
      @message = Message.find(params[:id])
      
      if @message.update(message_params)
        redirect_to room_path(@message.room_id)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @current_user = current_user
      @message = Message.find(params[:id])
      @message_user = @message.user_id
      @message.destroy
      redirect_to room_path(params[:room_id])
    end

    def delete_all
      @current_user = current_user
      @messages = Message.where(:room_id == params[:room_id]).destroy_all
      redirect_to room_path(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:content)
  end
end

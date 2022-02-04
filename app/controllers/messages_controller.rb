class MessagesController < ApplicationController
    # Specific Room
    def new


    end     

    def new
        @message = Message.new
      end
    
      def create
        @message = Message.new(date: DateTime.now(), user: params[:user],room: params[:room] body: params[:body])
    
        if @message.save
          redirect_to @message.room
        else
          render :new, status: :unprocessable_entity
        end
      end

      
    private
    def message_params
        params.require(:message).permit(:user,:room, :body)
    end
end

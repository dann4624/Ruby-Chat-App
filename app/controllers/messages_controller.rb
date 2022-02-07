class MessagesController < ApplicationController
    def create
        @current_user = current_user
        @message = Message.create(room_id: params[:room_id], user_id:params[:user_id], content: msg_params[:content], )
      end
    
      private
    
      def msg_params
        params.require(:message).permit(:content)
      end
end

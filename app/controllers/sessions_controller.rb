class SessionsController < ApplicationController
    def index
      @current_user = current_user
      redirect_to rooms_path if @current_user
    end

    def create
      user = User.find_by(email: params[:session][:email], password:params[:session][:password])
      if user
        log_in(user)
      else
        render 'new'
      end
    end
  
    def destroy
      log_out if logged_in?
      redirect_to root_path
    end
  
end
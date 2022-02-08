class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
    
        if @user.update(user_params)
          redirect_to @user
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def new
        @user = User.new
    end
    
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to rooms_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
        @user = User.find(params[:id])
        if @user == current_user
            log_out if logged_in?
        end
        @user.destroy
        redirect_to rooms_path, status: :see_other
    end

    def user_params
        params.require(:user).permit(:avatar,:username,:email,:password)
    end
end

class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @current_user = current_user
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
    
    def edit
      @user = User.find(params[:id])
      @current_user = current_user
      redirect_to '/signin' unless @current_user
      if @current_user != @user
        redirect_to rooms_path
      end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to @user
        else
          render :edit, status: :unprocessable_entity
        end
    end


    def user_params
        params.require(:user).permit(:avatar,:username,:email,:password)
    end
end

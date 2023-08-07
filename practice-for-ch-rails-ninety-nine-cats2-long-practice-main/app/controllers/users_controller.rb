class UsersController  < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:index, :show, :edit, :update]
    def new 
        @user = User.new 
        render :new
    end 

    def create 
        @user = User.new(user_param)

        if @user.save 
            login!(@user)
            redirect_to user_url(@user)
        else 
            render :new 
        end 

    end 

    


end 
class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end 

    def create 
        username = params[:user][:username]
        password = params[:user][:password]
        @user = User.find_by_credentials(username, password)

        if @user
            login(@user)
            redirect_to users_url
        else
            redirect_to new_session_url
        end 
    end 
end

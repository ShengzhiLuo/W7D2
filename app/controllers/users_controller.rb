class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to cats_url
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:id,:user_name, :password, :password_digest, :session_token)
    end
end

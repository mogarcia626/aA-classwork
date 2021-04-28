class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save!
            login_user!(@user)
            # redirect_to some_url  
        end
    end

    def user_params
        params.require(:users).permit(:email, :password)
    end
end

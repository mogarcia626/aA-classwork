class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login(user)
            redirect_to cats_url
        else
        end
        
    end

    def destroy

    end

end


#  is_password?(password)
#  self.find_by_credentials(user_name, password)
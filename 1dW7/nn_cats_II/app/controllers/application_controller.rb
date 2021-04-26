class ApplicationController < ActionController::Base
    helper_method :curr_user

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def curr_user
        @curr_user ||= User.find_by(session_token: session[:session_token])
    end
end

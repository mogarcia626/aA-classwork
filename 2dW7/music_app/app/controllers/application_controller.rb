class ApplicationController < ActionController::Base

    # C R R L L L
    helper method :current_user, :logged_in
    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end

    def require_logout
        redirect_to root_url if logged_in?
    end

    def login_user!(user) 
        session[session_token] = user.reset_session_token
    end

    def logout_user!
        @current_user.reset_session_token if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end
end

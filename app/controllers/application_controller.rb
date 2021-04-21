class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    before_action :authenticate_user!

    private

    def current_user
        @current_user ||= User.find(sessions[:user_id]) if session[:user_id]
    end
end

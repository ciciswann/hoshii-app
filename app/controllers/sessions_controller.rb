class SessionsController < ApplicationController

    def welcome
        render 'users/sessions/welcome'
    end

    def new
    end

    # def create
    #     user = User.find_by_email(params[:email])
    #     # If user exists AND password is correct
    #     if user && user.authenticate(params[:password])
    #         session[:user_id] = user.id
    #     elsif !user
    #         User.github
    #     else
    #         redirect_to '/login'
    #     end

    # end

    def github   
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            #set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
        else
            flash[:error] = 'There is a problem signing you in through Github. Please register or try signing in later.'
            redirect_to new_user_registration_url
        end
    end
   
    def failure
        flash[:error] = 'There is a problem signing you in. Please register or try signing in later.'
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/users/login'
    end
    
end

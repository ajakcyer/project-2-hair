class SessionsController < ApplicationController

    def logout 
        session.delete(:user_id)
        
        redirect_back fallback_location: stylists_path
      end 
    
      def new_login
      end 
    
      def login 
        # find user 
        @user = User.find_by(name: params[:session][:name])
        session[:user_id] = @user.id
        redirect_to stylists_path
    
        #compare passwords
        # if @user && @user.authenticate(params[:session][:password])
        #   session[:user_id] = @user.id 
        #   redirect_to bananas_path
        # else 
        #   flash[:error] = "Password or Email did not match"
        #   redirect_to new_login_path
        # end 
      end 
end

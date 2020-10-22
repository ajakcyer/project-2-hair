class SessionsController < ApplicationController

    def logout 
        session.delete(:user_id)
        
        redirect_to root_path    

        #fallback_location: stylists_path
      end 
    
      def new_login
      end 
      def login 
        # find user 
        @user = User.find_by(username: params[:session][:username])
        
          if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
          else 
            flash[:error] = "Password or Email did not match"
            redirect_to new_login_path
          end 
      end


      #####   STYLIST SECITON    ######

      def stylist_logout 
        session.delete(:stylist_id)
        
        redirect_to root_path  

        #fallback_location: stylists_path
      end 
    
      def stylist_new_login
      end 

      def stylist_login 
        # find user 
        @stylist = Stylist.find_by(username: params[:session][:username])
        
          if @stylist && @stylist.authenticate(params[:session][:password])
            session[:stylist_id] = @stylist.id 
            redirect_to stylist_path(@stylist)
          else 
            flash[:error] = "Password or Email did not match"
            redirect_to stylist_new_login_path
          end 
      end
      
      
end

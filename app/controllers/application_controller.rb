class ApplicationController < ActionController::Base

    before_action :logged_in_user?, :logged_in_stylist?

    def logged_in_user? 
      @current_user = User.find_by(id: session[:user_id])
    end 

    def logged_in_stylist? 
      @current_stylist = Stylist.find_by(id: session[:stylist_id])
    end 

end

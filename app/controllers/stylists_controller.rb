class StylistsController < ApplicationController
    
    def index
        @stylists = Stylist.all
    end

    def new
        @stylist = Stylist.new
    end

    def create
        @stylist = Stylist.create(stylist_params)

        if @stylist.valid?
            session[:stylist_id] = @stylist.id
            redirect_to stylist_path(@stylist)
        else
            flash[:new_stylist_errors] = @stylist.errors.full_messages
            redirect_to new_stylist_path
        end
    end
    
    def show
        find_stylist
        @appointment = Appointment.new
    end 
    
    
    private
    def find_stylist
        @stylist = Stylist.find(params[:id])
    end 

    def stylist_params
        params.require(:stylist).permit(:name, :username, :password)
    end
end

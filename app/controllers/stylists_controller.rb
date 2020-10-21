class StylistsController < ApplicationController
    
    def index
        @stylists = Stylist.all
    end
    
    def show
        find_stylist
        @appointment = Appointment.new
    end 
    
    
    private
    def find_stylist
        @stylist = Stylist.find(params[:id])
    
    end 
end

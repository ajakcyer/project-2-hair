class StylistsController < ApplicationController
    
    def index
        @stylists = Stylist.all
    end
    
    def show
        find_stylist
    end 
    
    
    private
    def find_stylist
        @stylist = Stylist.find(params[:id])
    
    end 
end

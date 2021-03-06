class StylistStylesController < ApplicationController

    def new
        @ss = StylistStyle.new
    end

    def create
        ss = StylistStyle.create(ss_params)
    
        @current_stylist.stylist_styles << ss

        if ss.valid?
            redirect_to stylist_path(@current_stylist)
        else
            flash[:hair_errors] = ss.errors.full_messages
            redirect_to new_stylist_style_path
        end
    end

    private

    def ss_params
        params.require(:stylist_style).permit(:style_name, :price, :style_img_url)
    end
end

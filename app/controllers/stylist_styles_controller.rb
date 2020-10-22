class StylistStylesController < ApplicationController

    def new
        @ss = StylistStyle.new
    end

    def create
        ss = StylistStyle.create(ss_params)
        byebug
        @current_stylist.stylist_styles << ss

        if ss.valid?
            redirect_to stylist_path(@current_stylist)
        else
            redirect_to new_stylist_styles_path
        end
    end

    private

    def ss_params
        params.require(:stylist_style).permit(:style_name, :price, :style_img_url)
    end
end

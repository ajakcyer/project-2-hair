class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end 
    def create
        @review = Review.create(review_params)
        @current_user.reviews << @review

        if @review.valid?
            redirect_to appointment_path(@review.appointment)
        else
            flash[:review_errors] = @review.errors.full_messages
            redirect_back fallback_location: user_path(@current_user)
        end

    end 


    private 
    def review_params
        params.require(:review).permit(:user_id, :appointment_id, :rating, :comment)
    end 
end

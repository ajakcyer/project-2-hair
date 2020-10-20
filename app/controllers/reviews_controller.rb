class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end 
    def create
        @review = Review.create(review_params)

        redirect_to user_path(@review.user)
    end 


    private 
    def review_params
        params.require(:review).permit(:user_id, :appointment_id, :rating, :comment)
    end 
end

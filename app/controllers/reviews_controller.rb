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

    def edit
        @review = Review.find(params[:id])
    end

    def update
        review = Review.find(params[:id])

        review.update(review_params)
        if review.valid?
            redirect_to appointment_path(review.appointment)
        else
            flash[:edit_review_errors] = review.errors.full_messages
            redirect_to edit_review_path(review)
        end
    end

    def destroy
        review = Review.find(params[:id])
        appointment_page = review.appointment
        
        review.destroy
        redirect_back fallback_location: appointment_path(appointment_page)

    end


    private 
    def review_params
        params.require(:review).permit(:user_id, :appointment_id, :rating, :comment)
    end 
end

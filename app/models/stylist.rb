class Stylist < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

    has_many :stylist_styles
    has_many :styles, through: :stylist_styles

    has_secure_password
    validates :name, :username, presence: true

    
    def stylist_rating

        review_array = []
         self.appointments.select do |app|
            if app.reviews[0]
                review_array << app.reviews[0]
            end
         end

        total_appointments_with_reviews = review_array.count

        if review_array.present?
            
            sum_of_ratings = review_array.sum do |review| 
                
                review.rating
            end

            sum_of_ratings/total_appointments_with_reviews
    
        else 
            return "No Ratings Yet!"
        end


    end

    
end

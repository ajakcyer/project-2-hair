class Stylist < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

    has_many :stylist_styles
    has_many :styles, through: :stylist_styles


    def stylist_rating
        total_appointments = self.appointments.count

        if total_appointments > 0
            
            sum_of_ratings     = self.appointments.collect{ |app| app.reviews[0].rating }.sum
    
            sum_of_ratings/total_appointments
    
        else 
            return "No Ratings Yet!"
        end


    end

    
end

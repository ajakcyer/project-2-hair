class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :stylist
    belongs_to :style
    has_many :reviews
    

    validates :date, presence: true
    validates :date, uniqueness: {scope: :stylist_id}

    
    validate :date_cannot_be_in_the_past
    validate :date_cannot_be_one_hr_before_or_after

    def date_cannot_be_in_the_past
      if date.present? && date < Time.now
        errors.add(:date, "can't be in the past")
      end
    end 

    ###an array of appointment dates by a particular stylist
    
    def stylist_dates
      appointments_by_my_stylist = Appointment.where(stylist: self.stylist)
      appointment_stylist_dates = []
      appointments_by_my_stylist.collect do |app|
        appointment_stylist_dates << app.date
      end 
      appointment_stylist_dates.pop
      appointment_stylist_dates
    end

    def date_cannot_be_one_hr_before_or_after
        booked_dates = self.stylist_dates
        byebug
        booked = booked_dates.any? do |app_date|
          byebug
          date.between?(app_date - 59.minutes, app_date + 59.minutes)
        end 
        byebug
      if date.present? && booked
        errors.add(:date, "(time) can't be booked 1 hour before or after another appointment")
      end
    end


    def stylist_name=(name)
        self.stylist = Stylist.find_by(name: name)
    end
    def stylist_name
        self.stylist.name
    end


    def appointment_in_past?
        self.date < Time.now
    end 
   
    
end

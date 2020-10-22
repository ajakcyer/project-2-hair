class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :stylist
    belongs_to :style
    has_many :reviews
    

    validates :date, presence: true
    validates :date, uniqueness: {scope: :stylist_id}

    
    validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
      if date.present? && date < Time.now
        errors.add(:date, "can't be in the past")
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

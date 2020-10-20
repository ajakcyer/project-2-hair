class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :stylist
    belongs_to :style
    has_many :reviews


    def stylist_name=(name)
        self.stylist = Stylist.find_by(name: name)
    end

    def stylist_name
        self.stylist.name
    end
    
end

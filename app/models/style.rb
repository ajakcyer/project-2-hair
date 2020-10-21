class Style < ApplicationRecord
    has_many :stylist_styles
    has_many :stylists, through: :stylist_styles
    has_many :appointments

    
end

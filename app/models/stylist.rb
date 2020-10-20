class Stylist < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    has_many :reviews
    has_many :stylist_styles
    has_many :styles, through: :stylist_styles

    
end

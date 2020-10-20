class Style < ApplicationRecord
    has_many :stylist_styles
    has_many :stylist, through: :stylist_styles

    
end

class StylistStyle < ApplicationRecord
    belongs_to :stylist
    belongs_to :style

    ##MAYBE SHOULD WORK SO EVERY STYLIST CAN ONLY HAVE ONE SPECIFIC STYLE
    validates :style, uniqueness: {scope: :stylist}

    
end

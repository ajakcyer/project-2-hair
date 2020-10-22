class StylistStyle < ApplicationRecord
    belongs_to :stylist
    belongs_to :style

    ##MAYBE SHOULD WORK SO EVERY STYLIST CAN ONLY HAVE ONE SPECIFIC STYLE
    validates :style, uniqueness: {scope: :stylist}
    validates :price, numericality: {greater_than: 1, less_than: 1000}

    

    def style_name=(name)
        self.style = Style.find_or_create_by(name: name)
    end

    def style_name
        self.style ? self.style.name : nil
    end

    
end

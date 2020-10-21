class Review < ApplicationRecord
    belongs_to :appointment
    belongs_to :user
    
    validates :rating, :comment, presence: true
    validates :rating, numericality: { greater_than: 0, less_than: 6 }
    
end

class User < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :reviews


end

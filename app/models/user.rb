class User < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    has_many :reviews

    has_secure_password

    validates :name, :username, :password, presence: true 


end

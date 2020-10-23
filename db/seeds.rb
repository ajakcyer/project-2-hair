# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'pry'

# StylistStyle.destroy_all
# Appointment.destroy_all

# Style.destroy_all
# Stylist.destroy_all
# User.destroy_all




# ajak = User.create(name: "Ajak", password ***)
# sam =  User.create(name: "Sam", password ***)






# 5.times do

#     Style.create(name: Faker::FunnyName.unique.name)

# end





# 5.times do

#     Appointment.create(stylist_id: Stylist.all.sample.id, user_id: User.all.sample.id, style_id: Style.all.sample.id, date: Time.zone.at(Date.current.to_time).to_datetime)

# end


####### OFFICIAL SEEDS TO PRESENT WITH #######


##STYLIST STYLES ASSOCIATION: stylist_id:int, style_id:int, price:int, style_img_url:string [make an array]

#style_imgs = []
# "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRX_Ncyqa8M7lBrXwuJzYZ9rPMKGarDzEOUGQ&usqp=CAU"
# 10.times do 

#     StylistStyle.create(stylist_id: Stylist.all.sample.id, style_id: Style.all.sample.id, price: rand(1..100), style_img_url: style_imgs.each {|} )

# end 

# STYLES AND CUTS
style_names = [
            "Dark Caesar",
            "Light Caesar",
            "Fade",
            "High Top Fade",
            "Man Bun",
            "Locs",
            "Twists",
            "Box Braids",
            "Passion Twists",
            "Shampoo & Deep Conditioning Treatment",
            "Beard",
            "Color/Dye",
            "Highlights",
            "Wave Treatment",
            "Mullet"
        ]

names = []
5.times do
    names << Faker::JapaneseMedia::Naruto.character
end
binding.pry

ordered_style_names = style_names.sort

ordered_style_names.each do |s_name|
    Style.create(name: s_name)
end

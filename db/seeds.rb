# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


StylistStyle.destroy_all
Appointment.destroy_all

Style.destroy_all
Stylist.destroy_all
User.destroy_all




# ajak = User.create(name: "Ajak", password ***)
# sam =  User.create(name: "Sam", password ***)




5.times do

    Stylist.create(name: Faker::FunnyName.unique.two_word_name, years_of_experience: rand(1..10))

end


50.times do

    Style.create(name: Faker::FunnyName.unique.name, description: Faker::JapaneseMedia::Naruto.unique.character)

end


100.times do 

    StylistStyle.create(stylist_id: Stylist.all.sample.id, style_id: Style.all.sample.id, price: rand(1..100), style_img_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRX_Ncyqa8M7lBrXwuJzYZ9rPMKGarDzEOUGQ&usqp=CAU")

end 



# 5.times do

#     Appointment.create(stylist_id: Stylist.all.sample.id, user_id: User.all.sample.id, style_id: Style.all.sample.id, date: Time.zone.at(Date.current.to_time).to_datetime)

# end
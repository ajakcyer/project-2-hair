class Stylist < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    has_many :reviews
    has_many :stylist_styles
    has_many :styles, through: :stylist_styles

    #accepts_nested_attributes_for :appointments

    # <h2>Create an Appointment with <%= @stylist.name %></h2>

# <%= form_for @stylist, url: appointments_path, method: :post do |f| %>

# <% if flash[:my_appointment_errors] %>
#     <% flash[:my_appointment_errors].each do |error| %>
#         <p style="color:red"><strong><%= error %></strong></p>
#     <% end %>
# <% end %><br>

#     <%# CHANGE hidden field so we can add an appointment to stylist from the stylist#  %>
#     <%= f.fields_for :appointments, @stylist.appointments.build do |ff| %>
#         <%= ff.label :stylist_id, @stylist.name %>
#         <%= ff.hidden_field :stylist_id, :value => @stylist.id %>
#         <br>
#         <%= ff.label :style_id %>
#         <%= ff.collection_select :style_id, @stylist.styles, :id, :name %>
#         <br>
#         <%= ff.label :date %>
#         <%= ff.datetime_field :date, min: Date.today %>
#     <% end %>
#     <%= f.submit "Create Appointment" %>
# <% end %>

    
end

class AppointmentsController < ApplicationController
    def show
        find_appointment
    end
    

    def create
        
        #new_appointment = Appointment.create(appointment_from_stylist_params)
        new_appointment = Appointment.create(stylist_id: params[:stylist][:appointments_attributes]["0"][:stylist_id], style_id: params[:stylist][:appointments_attributes]["0"][:style_id], date: params[:stylist][:appointments_attributes]["0"][:date])
        @current_user.appointments << new_appointment
        byebug
        # @appointments = Appointment.all
        # @stylist = Stylist

        if new_appointment.valid?
            #@current_user.appointments << new_appointment
            redirect_to appointment_path(new_appointment)
        else
            redirect_to stylists_path
        end
    end


    def edit
        find_appointment
    end
    def update
        find_appointment

        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        else
            redirect_to edit_appointment_path(@appointment)
        end 
    end


    def destroy
    end 

    
    
    private 
    def find_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:user_id, :stylist_id, :date)
    end

    def appointment_from_stylist_params
        params.require(:stylist).permit(appointments_attributes: [:stylist_id, :style_id, :date])
    end

end

class AppointmentsController < ApplicationController
    def show
        find_appointment
    end
    

    def create

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

end

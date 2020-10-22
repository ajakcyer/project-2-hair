class AppointmentsController < ApplicationController
    def show
        find_appointment

        @review = Review.new

        if @appointment.reviews.present?
           @edit_review = @appointment.reviews[0]
        end 
    end
    

    def create
        new_appointment = Appointment.create(appointment_params)

        @current_user.appointments << new_appointment
        
        # @appointments = Appointment.all
        # @stylist = Stylist
        byebug
        if new_appointment.valid?
            #@current_user.appointments << new_appointment
            redirect_to appointment_path(new_appointment)
        else
            flash[:my_appointment_errors] = new_appointment.errors.full_messages
            
            redirect_back fallback_location: stylists_path
        end
    end


    def edit
        find_appointment

        @stylist = @appointment.stylist
    end
    def update
        find_appointment
        @appointment.update(appointment_params)

        # if @appointment.update(appointment_params)
        if @appointment.valid?
            redirect_to appointment_path(@appointment)
        else
            flash[:appointment_errors] = @appointment.errors.full_messages 
            redirect_to edit_appointment_path(@appointment)
        end 
    end


    def destroy
        find_appointment
        @appointment.destroy 

        redirect_to user_path(@current_user)
    end 

    
    
    private 
    def find_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:user_id, :stylist_id, :style_id, :date)
    end

end

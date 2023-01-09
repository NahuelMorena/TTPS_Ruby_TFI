class AppointmentsController < ApplicationController
    before_action :find_appointment, only: %i[ show edit update destroy ]
  
    #GET /appointments 
    def index
      @appointments = Appointment.all
    end
  
    #GET /appointments/new
    def new
      @appointment = Appointment.new
    end
  
    #POST /appointments
    def create
      @appointment = current_user.appointments.create(appointment_params)
      redirect_to @appointment
    end
  
    #GET /appointments/:id
    def show
    end
  
    #GET /appointments/:id/edit
    def edit
    end
  
    #PATCH /appointments/:id 
    def update
      @appointment.update(appointment_params)
      redirect_to @appointment
    end
  
    #DELETE /appointments/:id
    def destroy
      @appointment.destroy
    end
  
    private
      def find_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      def appointment_params
        params.require(:appointment).permit(:date, :hour, :reason, :branch_office_id, :result, :personal_id)
      end
end
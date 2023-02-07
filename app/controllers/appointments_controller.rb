class AppointmentsController < ApplicationController
    load_and_authorize_resource
    before_action :find_appointment, only: %i[ show edit update destroy attending register_attention]
  
    #GET /appointments 
    def index
      @appointments = Appointment.all.order(:date, :hour)
    end
  
    #GET /appointments/new
    def new
      @appointment = Appointment.new
    end
  
    #POST /appointments
    def create
      @appointment = current_user.appointments.create(appointment_params)

      if @appointment.invalid?
        return redirect_to new_appointment_path, alert: @appointment.errors.full_messages.first
      end

      redirect_to @appointment, notice: "Se a registrado el turno correctamente"
    end
  
    #GET /appointments/:id
    def show
    end
  
    #GET /appointments/:id/edit
    def edit
      @edit = true
    end
  
    #PATCH /appointments/:id 
    def update
      @appointment.update(appointment_params)
      
      if @appointment.invalid?
        return redirect_to edit_appointment_path(@appointment), alert: @appointment.errors.full_messages.first
      end

      if (params[:appointment][:state_id] == '3')
        redirect_to root_path, notice: "Se a cancelado el turno correctamente"
      else 
        redirect_to @appointment, notice: "Se a actualizado el turno correctamente"
      end 
    end
  
    #DELETE /appointments/:id
    def destroy
      @appointment.destroy
      redirect_to appointments_path, notice: "Se a borrado el turno correctamente"
    end

    #GET /appointments/:id/attending
    def attending
    end

    #PATCH /appointments/:id/attending
    def register_attention
      params[:appointment][:state_id] = 2
      params[:appointment][:personal_id] = current_user.id
      @appointment.update(appointment_params)

      if @appointment.invalid?
        return redirect_to attending_appointment_path(@appointment), alert: @appointment.errors.full_messages.first
      end

      redirect_to @appointment
    end

    private
      def find_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      def appointment_params
        params.require(:appointment).permit(:date, :hour, :reason, :branch_office_id, :result, :personal_id, :state_id)
      end
end
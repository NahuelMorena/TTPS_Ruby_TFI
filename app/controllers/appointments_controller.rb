class AppointmentsController < ApplicationController
    before_action :find_appointment, only: %i[ show edit update destroy attending register_attention]
  
    #GET /appointments 
    def index
      @appointments = Appointment.all
    end
  
    #GET /appointments/new
    def new
      @appointment = Appointment.new
      @button_text = "Crear turno"
    end
  
    #POST /appointments
    def create
      
      message = validate_params(params)
      if message 
        return redirect_to new_appointment_path, alert: message
      end

      @appointment = current_user.appointments.create(appointment_params)
      redirect_to @appointment, notice: "Se a registrado el turno correctamente"
    end
  
    #GET /appointments/:id
    def show
    end
  
    #GET /appointments/:id/edit
    def edit
      @edit = true
      @button_text = "Actualizar turno"
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

    #GET /appointments/:id/attending
    def attending
    end

    #PATCH /appointments/:id/attending
    def register_attention
      params[:appointment][:state_id] = 2
      params[:appointment][:personal_id] = current_user.id
      @appointment.update(appointment_params)
      redirect_to @appointment
    end
  
    private
      def find_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      def appointment_params
        params.require(:appointment).permit(:date, :hour, :reason, :branch_office_id, :result, :personal_id, :state_id)
      end

      def validate_params(params)
        branch_office = BranchOffice.find(params[:appointment][:branch_office_id])
        error = branch_office.valid_appointment(params[:appointment][:date], params[:appointment][:hour])  
        if error
          if error == 1
            return "El dia seleccionado no se encuentra entre los disponibles de atención de la sucursal."
          else
            return "El horario seleccionado no se encuentra entre los disponibles de atención de la sucursal"
          end
        end
      end
end
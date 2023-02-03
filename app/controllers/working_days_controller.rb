class WorkingDaysController < ApplicationController
    load_and_authorize_resource
    before_action :find_working_day, except: %i[new create index]

    #GET  /working_days
    def index
        @working_days = WorkingDay.all
    end

    #GET /working_days/new
    def new
        @working_day = WorkingDay.new
        @button_text = "Crear dia de trabajo"
    end

    #POST /working_days
    def create
        if WorkingDay.find_by_branch_office_id_and_day(params[:working_day][:branch_office_id],params[:working_day][:day]) 
            redirect_to new_working_day_path, alert: "El dia de trabajo para esta sucursal ya existe en el sistema"
        else 
            @working_day = WorkingDay.create(working_day_params)
            redirect_to working_days_path, notice: "El dia laboral se a registado correctamente"
        end
    end

    #GET /working_days/:id
    def show
    end

    #GET /working_days/:id/edit
    def edit
        @button_text = "Actualizar dia de trabajo"
    end

    #PATCH /working_days/:id
    def update
        working_dayDB = WorkingDay.find_by_branch_office_id_and_day(params[:working_day][:branch_office_id], params[:working_day][:day])
        if @working_day.id != working_dayDB.id
            redirect_to edit_working_day_path, alert: "El dia de trabajo para esta sucursal ya existe en el sistema"
        else 
            @working_day.update(working_day_params)
            redirect_to working_days_path, notice: "El dia laboral se a registado correctamente"
        end
    end

    #DELETE /working_day/:id
    def destroy
        @working_day.destroy
        redirect_to working_days_path, notice: "El dia laboral fue eliminado satisfactoriamente"
    end

    private 
      def find_working_day
        @working_day = WorkingDay.find(params[:id])
      end

      def working_day_params
        params.require(:working_day).permit(:day,:attention_time_id,:branch_office_id)
      end
end

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
    end

    #POST /working_days
    def create
        @working_day = WorkingDay.create(working_day_params)
        
        if @working_day.invalid?
            return redirect_to new_working_day_path, alert: @working_day.errors.full_messages.first
        end
        
        redirect_to working_days_path, notice: "El dia laboral se a registado correctamente"
    end

    #GET /working_days/:id
    def show
    end

    #GET /working_days/:id/edit
    def edit
    end

    #PATCH /working_days/:id
    def update
        @working_day.update(working_day_params)

        if @working_day.invalid?
            return redirect_to edit_working_day_path, alert: @working_day.errors.full_messages.first
        end
        
        redirect_to working_days_path, notice: "El dia laboral se a registado correctamente"
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

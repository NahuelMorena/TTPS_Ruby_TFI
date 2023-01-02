class WorkingDaysController < ApplicationController
    before_action :find_working_day, except: [:new, :create, :index]

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
        printf("id de la sucursal: #{params[:working_day][:branch_office_id]}")
        printf("dia seleccionado #{:day}")
        printf("id del tiempo de atenciòn #{:attention_time_id}")
        printf("----")
        #branch_office = BranchOffice.find(params[:working_day][:branch_office_id])
        #@working_day = branch_office.working_days.create(working_day_params)

        @working_day = WorkingDay.create(working_day_params)
        redirect_to @working_day
    end

    #GET /working_days/{id}
    def show
    end

    #GET /working_days/{id}/edit
    def edit
    end

    #PATCH /working_days/{id}
    def update
        @working_day.update(working_day_params)
        redirect_to @working_day 
    end

    #DELETE /working_day/{id}
    def destroy
        @working_day.destroy
        redirect_to root_path
    end

    def find_working_day
        @working_day = WorkingDay.find(params[:id])
    end

    def working_day_params
        params.require(:working_day).permit(:day,:attention_time_id,:branch_office_id)
    end
end

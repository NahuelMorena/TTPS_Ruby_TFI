class BranchOfficesController < ApplicationController
    load_and_authorize_resource
    before_action :find_branch_office, except: %i[new create index appointments]
    
    #GET /branch_offices
    def index 
        @branch_offices = BranchOffice.all
    end
    
    #GET /branch_offices/new
    def new
        @branch_office = BranchOffice.new
    end

    #POST /branch_offices
    def create 
        @branch_office = BranchOffice.create(branch_office_params)

        if @branch_office.invalid?
            redirect_to new_branch_office_path, alert: @branch_office.errors.full_messages.first
        else 
            redirect_to @branch_office , notice: "Sucursal creada exitosamente"
        end
    end

    #GET /branch_offices/:id
    def show
    end

    #GET /branch_offices/:id/edit
    def edit
    end

    #PATCH /branch_offices/:id
    def update
        @branch_office.update(branch_office_params)

        if @branch_office.invalid?
            return redirect_to edit_branch_office_path, alert: @branch_office.errors.full_messages.first
        end

        redirect_to @branch_office, notice: "Sucursal actualizada exitosamente"
    end

    #DELETE /branch_offices/:id
    def destroy
        if (User.where(branch_office_id: @branch_office.id).any?)
            return redirect_to @branch_office, alert: "No se puede eliminar sucursal que cuente con personal bancario"
        end

        begin
            @branch_office.destroy
            redirect_to branch_offices_path, notice: "Sucursal eliminada satisfactoriamente"
        rescue => exception
            redirect_to @branch_office, alert: "No se puede borrar sucursales que cuenten con dias laborables y/o turnos asignados"
        end
    end

    #GET /branch_offices/:id/appointments
    def appointments 
    end

    private 
      def find_branch_office
        @branch_office = BranchOffice.find(params[:id])
      end

      def branch_office_params
        params.require(:branch_office).permit(:name,:direction,:phone,:location_id)
      end
end

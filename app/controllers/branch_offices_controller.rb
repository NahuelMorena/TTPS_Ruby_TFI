class BranchOfficesController < ApplicationController
    before_action :find_branch_office, except: [:new, :create, :index]
    
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
            redirect_to new_branch_office_path, alert: @branch_office.get_error()
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
        if BranchOffice.where(name: params[:branch_office][:name]).any?
            redirect_to edit_branch_office_path, alert: "El nombre ingresado ya se encuentra en el sistema"
        else
            @branch_office.update(branch_office_params)
            redirect_to @branch_office , notice: "Sucursal actualizada exitosamente"
        end
    end

    #DELETE /branch_offices/:id
    def destroy
        unless @branch_office.working_days.empty?
            redirect_to @branch_office, alert: "No se puede eliminar sucursales con dias laborales"
        else 
            @branch_office.destroy
            redirect_to branch_offices_path, notice: "Sucursal eliminada satisfactoriamente"
        end 
    end

    private 
      def find_branch_office
        @branch_office = BranchOffice.find(params[:id])
      end

      def branch_office_params
        params.require(:branch_office).permit(:name,:direction,:phone,:location_id)
      end

      def validate_params()
        #valida que los datos ingresados sean validos
      end
end

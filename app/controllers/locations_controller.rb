class LocationsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :find_location, only: %i[ show edit update destroy ]

    #GET /locations 
    def index
      @locations = Location.all
    end
    
    #GET /locations/new
    def new
      @location = Location.new
    end

    #POST /locations 
    def create
      if Location.where(name: params[:location][:name], province_id: params[:location][:province_id]).any?
        redirect_to new_location_path, alert: "La combinación de nombre de localidad y provincia ya se encuentra en el sistema"
      else
        @location = Location.create(location_params)
        redirect_to @location, notice: "Localización creada exitosamente"
      end
    end

    #GET /locations/:id
    def show
    end

    #GET /locations/:id/edit
    def edit
    end
    
    #PATCH /locations/:id
    def update
      if Location.where(name: params[:location][:name], province_id: params[:location][:province_id]).any?
        redirect_to edit_location_path, alert: "La combinación de nombre de localidad y provincia ya se encuentra en el sistema"
      else
        @location.update(location_params)
        redirect_to locations_path , notice: "Localidad actualizada exitosamente"
      end
    end

    #DELETE /locations/:id
    def destroy
      message = evaluate_delete_condition()

      if message
        redirect_to @location, alert: message
      else
        @location.destroy
        redirect_to locations_path, notice: "Localidad eliminada satisfactoriamente"
      end
    end

    private
      def find_location
        @location = Location.find(params[:id])
      end

      def location_params
        params.require(:location).permit(:name, :province_id)
      end

      def evaluate_delete_condition
        message = ""

        unless @location.branch_offices.empty?
          return "No se puede eliminar una localidad con sucursales en el sistema"
        end

        message
      end
end

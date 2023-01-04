class LocationsController < ApplicationController
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
      @location = Location.create(location_params)
      if @location.invalid?
        redirect_to new_location_path, alert: @location.full_messages.first
      else
        redirect_to @location , notice: "Localización creada exitosamente"
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
      if Location.where(name: params[:location][:name]).any?
        redirect_to edit_location_path, alert: "El nombre ingresado ya se encuentra en el sistema"
      else
        @location.update(location_params)
        redirect_to locations_path , notice: "Localidad actualizada exitosamente"
      end
    end

    #DELETE /locations/:id
    def destroy
      unless @location.branch_offices.empty?
        redirect_to @location, alert: "No se puede eliminar una localidad con sucursales en el sistema"
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
end

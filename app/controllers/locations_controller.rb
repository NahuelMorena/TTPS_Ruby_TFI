class LocationsController < ApplicationController
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
      @location = Location.create(location_params)

      if @location.invalid?
        return redirect_to new_location_path, alert: @location.errors.full_messages.first
      end

      redirect_to @location, notice: "Localización creada exitosamente"
    end

    #GET /locations/:id
    def show
    end

    #GET /locations/:id/edit
    def edit
    end
    
    #PATCH /locations/:id
    def update
      @location.update(location_params)

      if @location.invalid?
        return redirect_to edit_location_path, alert: @location.errors.full_messages.first
      end

      redirect_to locations_path , notice: "Localidad actualizada exitosamente"
    end

    #DELETE /locations/:id
    def destroy   
      begin
        @location.destroy
        redirect_to locations_path, notice: "Localidad eliminada satisfactoriamente"
      rescue => exception
        redirect_to @location, alert: "No se puede eliminar una localidad con sucursales en el sistema"
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

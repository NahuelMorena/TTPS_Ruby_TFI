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
      redirect_to @location , notice: "Localidad creada exitosamente"
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
      redirect_to @location
    end

    #DELETE /locations/:id
    def destroy
      @location.destroy
      redirect_to locations_path
    end

    private
      def find_location
        @location = Location.find(params[:id])
      end

      def location_params
        params.require(:location).permit(:name, :province_id)
      end
end

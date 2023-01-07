class ProvincesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :find_province, only: %i[ show edit update destroy ]

    #GET /provinces
    def index
      @provinces = Province.all
    end

    #GET /provinces/new
    def new
      @province = Province.new
    end

    #POST /provinces 
    def create
      @province = Province.create(province_params) 
      if @province.invalid?
        redirect_to new_province_path, alert: @province.errors.full_messages.first
      else
        redirect_to provinces_path , notice: "Provincia creada exitosamente"
      end
    end

    #GET /provinces/:id
    def show
    end

    #GET /provinces/:id/edit
    def edit
    end

    #PATCH /provinces/:id
    def update
      if Province.where(name: params[:province][:name]).any?
        redirect_to edit_province_path, alert: "El nombre ingresado ya se encuentra en el sistema"
      else
        @province.update(province_params)
        redirect_to provinces_path , notice: "Provincia actualizada exitosamente"
      end
    end

    #DELETE /provinces/:id
    def destroy
      unless @province.locations.empty?
        redirect_to @province, alert: "No se puede eliminar una provincia con localidades en el sistema"
      else 
        @province.destroy
        redirect_to provinces_path, notice: "Provincia eliminada satisfactoriamente"
      end
    end

    private
      def find_province
        @province = Province.find(params[:id])
      end

      def province_params
        params.require(:province).permit(:name)
      end
end

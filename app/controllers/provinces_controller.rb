class ProvincesController < ApplicationController
    load_and_authorize_resource
    before_action :find_province, only: %i[ show edit update destroy ]

    #GET /provinces
    def index
      @provinces = Province.all.sort_by(&:name)
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
      @province.update(province_params)

      if @province.invalid?
        return redirect_to edit_province_path, alert: @province.errors.full_messages.first
      end

      redirect_to provinces_path , notice: "Provincia actualizada exitosamente"
    end

    #DELETE /provinces/:id
    def destroy
      message = evaluate_delete_condition()
      
      if message 
        redirect_to @province, alert: message
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
      
      def evaluate_delete_condition
        message = ""
        unless @province.locations.empty?
          return "No se puede eliminar una provincia con localidades en el sistema"
        end

        message
      end
end

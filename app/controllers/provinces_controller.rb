class ProvincesController < ApplicationController
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
      redirect_to @province , notice: "Provincia creada exitosamente"
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
      redirect_to @province
    end

    #DELETE /provinces/:id
    def destroy
      @province.destroy
    end

    private
      def find_province
        @province = Province.find(params[:id])
      end

      def province_params
        params.require(:province).permit(:name)
      end
end

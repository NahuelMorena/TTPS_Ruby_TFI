class AttentionTimesController < ApplicationController
    before_action :find_attention_time, except: [:new, :create, :index]

    #GET /attention_times
    def index
        @attention_times = AttentionTime.all
    end

    #GET /attention_times/new
    def new
        @attention_time = AttentionTime.new
    end

    #POST /attention_times
    def create 
        if AttentionTime.find_by_hour_start_and_hour_end(params[:attention_time][:hour_start], params[:attention_time][:hour_end])
            redirect_to new_attention_time_path, alert: "La franja horaria ya existe en el sistema"
        else  
            @attention_time = AttentionTime.create(attention_time_params)
            redirect_to attention_times_path
        end
    end

    #GET /attention_times/:id
    def show
    end

    #GET /attention_times/:id/edit
    def edit
    end
    
    #PATCH /attention_times/:id
    def update
        if AttentionTime.find_by_hour_start_and_hour_end(params[:attention_time][:hour_start], params[:attention_time][:hour_end])
            redirect_to edit_attention_time_path, alert: "La franja horaria ya existe en el sistema"
        else  
            @attention_time.update(attention_time_params)
            redirect_to attention_times_path
        end
    end
    
    #DELETE /attention_times/:id
    def destroy
        unless @attention_time.working_days.empty?
            redirect_to @attention_time, alert: "No se puede eliminar franjas horarias que se encuentren en uso"
        else
            @attention_time.destroy
            redirect_to attention_times_path, notice: "La franja horaria fue eliminada satisfactoriamente"
        end
    end

    private
      def find_attention_time
        @attention_time = AttentionTime.find(params[:id])
      end

      def attention_time_params
        params.require(:attention_time).permit(:hour_start,:hour_end)
      end
end

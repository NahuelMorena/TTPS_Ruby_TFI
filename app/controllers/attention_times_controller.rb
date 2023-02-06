class AttentionTimesController < ApplicationController
    load_and_authorize_resource
    before_action :find_attention_time, except: %i[ new create index]

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
        @attention_time = AttentionTime.create(attention_time_params)
        
        if @attention_time.invalid?
            return redirect_to new_attention_time_path, alert: @attention_time.errors.full_messages.first
        end
        
        redirect_to @attention_time
    end

    #GET /attention_times/:id
    def show
    end

    #GET /attention_times/:id/edit
    def edit
    end
    
    #PATCH /attention_times/:id
    def update        
        @attention_time.update(attention_time_params)
            
        if @attention_time.invalid?
            return redirect_to edit_attention_time_path, alert: @attention_time.errors.full_messages.first
        end
        
        redirect_to @attention_time
    end
    
    #DELETE /attention_times/:id
    def destroy
        begin
            @attention_time.destroy
            redirect_to attention_times_path, notice: "La franja horaria fue eliminada satisfactoriamente"
        rescue => exception
            redirect_to @attention_time, alert: "No se puede eliminar franjas horarias que se encuentren en uso"
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

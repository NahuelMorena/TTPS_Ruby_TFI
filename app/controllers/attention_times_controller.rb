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
        @attention_time = AttentionTime.create(attention_time_params)
        redirect_to attention_times_path
    end

    #GET /attention_times/{id}
    def show
    end

    #GET /attention_times/{id}/edit
    def edit
    end
    
    #PATCH branch_offices/{id}
    def update
        @attention_time.update(attention_time_params)
        redirect_to @attention_time
    end
    
    #DELETE branch_offices/{id}
    def destroy
        @attention_time.destroy
        redirect_to root_path
    end

    def find_attention_time
        @attention_time = AttentionTime.find(params[:id])
    end

    def attention_time_params
        params.require(:attention_time).permit(:hour_start,:hour_end)
    end
end

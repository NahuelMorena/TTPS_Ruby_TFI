class WorkingDay < ApplicationRecord
    belongs_to :branch_office
    belongs_to :attention_time

    @@days = { 
        "1" => "Lunes", 
        "2" => "Martes", 
        "3" => "Miercoles", 
        "4" => "Jueves", 
        "5" => "Viernes", 
        "6" => "Sabado", 
        "7" => "Domingo"
    }
    
    def get_day_name(day_number)  
        @@days[day_number]
    end
end

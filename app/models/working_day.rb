class WorkingDay < ApplicationRecord
    validates :day, :branch_office, :attention_time, presence: true

    belongs_to :branch_office
    belongs_to :attention_time
    
    @@days_names = { 
        "1" => "Lunes", 
        "2" => "Martes", 
        "3" => "Miercoles", 
        "4" => "Jueves", 
        "5" => "Viernes", 
        "6" => "Sabado", 
        "7" => "Domingo"
    }

    @@days_numbers = {
        "Mon" => "1",
        "Tue" => "2",
        "Wed" => "3",
        "Thu" => "4",
        "Fri" => "5",
        "Sat" => "6",
        "Sun" => "7"
    }

    # Class methods

    def self.get_day_number(date)
        date = date.split("-")
        @@days_numbers[Time.new(date[0].to_i,date[1].to_i,date[2].to_i).ctime.split(" ").first]
    end

    def self.get_by_attention_time(attention_time)
        WorkingDay.where(attention_time_id: attention_time.id)
    end

    #Instance methods

    def get_day_name(day_number)  
        @@days_names[day_number]
    end
 
end

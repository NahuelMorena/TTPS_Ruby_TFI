class BranchOffice < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, :direction, :phone, presence: true
    has_many :working_days
    has_many :appointments
    belongs_to :location

    @@errors = {
        "Name has already been taken" => "El nombre seleccionado ya se encuentra en uso"
    }

    def get_error
        error = @@errors[self.errors.full_messages.first] 
        if error.nil? 
            error = "Se deben completar todos los campos"
        end
        error
    end

    def get_appointments_by_filter(filter)
        self.appointments.select {|item| item.has_role?(filter) }
    end

    def valid_appointment(date,hour)

        number_day = WorkingDay.get_day_number(date)
        working_day = WorkingDay.find_by_branch_office_id_and_day(self.id, number_day)
        
        unless working_day
            return 1
        end

        unless working_day.attention_time.valid_time?(hour)
            return 2
        end
    end
end

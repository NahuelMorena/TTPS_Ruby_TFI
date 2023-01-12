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

end

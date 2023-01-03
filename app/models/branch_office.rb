class BranchOffice < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, :direction, :phone, presence: true
    has_many :working_days

    @@errors = {
        "Name has already been taken" => "El nombre seleccionado ya se encuentra en uso"
    }

    def get_error()
        error = @@errors[self.errors.full_messages.first] 
        if error.nil? 
            error = "Se deben completar todos los campos"
        end
        error
    end
end

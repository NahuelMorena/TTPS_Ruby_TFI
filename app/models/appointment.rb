class Appointment < ApplicationRecord
    belongs_to :user
    #belongs_to :personal, class_name: "User"
    belongs_to :branch_office
    belongs_to :state
    enum state: [:slope, :cancelled, :attended]

    def has_role?(filter)
        self.state.name == filter
    end

    def get_personal
        User.find(self.personal_id)
    end
end

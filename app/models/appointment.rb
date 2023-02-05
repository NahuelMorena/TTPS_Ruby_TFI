class Appointment < ApplicationRecord
    validates :date, :hour, :reason, :user_id, :branch_office_id, :state_id presence: true
    belongs_to :user
    belongs_to :branch_office
    belongs_to :state
    enum state: [:slope, :cancelled, :attended]

    #Class methods

    def self.sort_by_date_and_hour(appointments)
        appointments.sort_by {|obj| [obj.date, obj.hour] }
    end 

    def self.get_by_branch_office(branch_office)
        Appointment.where(branch_office_id: branch_office.id)
    end

    def self.get_by_state_and_user(state_id,user)
        Appointment.where(state_id: state_id, user_id: user.id)
    end

    #Instance methods

    def has_role?(filter)
        self.state.name == filter
    end

    def get_personal
        User.find(self.personal_id)
    end
end

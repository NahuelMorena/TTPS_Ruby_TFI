class BranchOffice < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :direction, :phone, :location_id, presence: true
    has_many :working_days
    has_many :appointments
    belongs_to :location

    # Class Methods

    # Instance Methods

    def get_appointments_by_filter(filter)
        self.appointments.select {|item| item.has_role?(filter) }
    end

    def get_personal_users
        User.get_user_by_branch_office(self)
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

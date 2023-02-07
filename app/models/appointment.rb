class Appointment < ApplicationRecord
    validates :date, :hour, :reason, :user_id, :branch_office_id, :state_id, presence: true
    validates :result, presence: true, if: Proc.new {|item| !item.personal_id.nil? } 
    validate :date_cannot_be_outside_of_working, :hour_cannot_be_outside_of_attention_time
    belongs_to :user
    belongs_to :branch_office
    belongs_to :state

    #validates

    def blank_attribute?(date, branch_office_id, hour)
        return date && branch_office_id && hour
    end

    def date_cannot_be_outside_of_working
        if blank_attribute?(date, branch_office_id, hour)
          number_day = WorkingDay.get_day_number(date)
          working_day = WorkingDay.find_by_branch_office_id_and_day(branch_office_id, number_day)

          unless working_day 
            errors.add(:date, "seleccionada no se encuentra entre los días disponibles de atención de la sucursal.")
          end
        end
    end

    def hour_cannot_be_outside_of_attention_time
        if blank_attribute?(date, branch_office_id, hour)
          number_day = WorkingDay.get_day_number(date)
          working_day = WorkingDay.find_by_branch_office_id_and_day(branch_office_id, number_day)

          if working_day
            unless working_day.attention_time.valid_time?(hour)
                errors.add(:hour, "seleccionada no se encuentra entre la franja horaria de atención disponible")
            end
          end
        end
    end

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

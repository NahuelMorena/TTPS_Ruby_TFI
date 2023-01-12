class AttentionTime < ApplicationRecord
    has_many :working_days

    def get_hour(hour)
        hour.strftime("%H:%M")
    end

    def get_by_format
        "#{self.get_hour(hour_start)} - #{self.get_hour(hour_end)}"
    end

    def valid_time?(hour)
        return (self.get_hour(hour_start) <= hour) & (self.get_hour(hour_end) >= hour)
    end
end

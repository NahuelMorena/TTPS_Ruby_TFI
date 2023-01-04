class AttentionTime < ApplicationRecord
    has_many :working_days

    def get_by_format
        "#{hour_start.strftime("%H:%M")} - #{hour_end.strftime("%H:%M")}"
    end
end
